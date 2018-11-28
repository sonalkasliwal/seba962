/*
 * Copyright 2018-present Open Networking Foundation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.onosproject.provider.general.device.impl;

import com.google.common.annotations.Beta;
import com.google.common.collect.Sets;
import gnmi.Gnmi.Notification;
import gnmi.Gnmi.Path;
import gnmi.Gnmi.PathElem;
import gnmi.Gnmi.SubscribeRequest;
import gnmi.Gnmi.Subscription;
import gnmi.Gnmi.SubscriptionList;
import gnmi.Gnmi.SubscriptionMode;
import gnmi.Gnmi.Update;
import org.onosproject.gnmi.api.GnmiClient;
import org.onosproject.gnmi.api.GnmiController;
import org.onosproject.gnmi.api.GnmiEvent;
import org.onosproject.gnmi.api.GnmiEventListener;
import org.onosproject.gnmi.api.GnmiEventSubject;
import org.onosproject.gnmi.api.GnmiUpdate;
import org.onosproject.gnmi.api.GnmiUtils;
import org.onosproject.mastership.MastershipEvent;
import org.onosproject.mastership.MastershipListener;
import org.onosproject.mastership.MastershipService;
import org.onosproject.net.DefaultAnnotations;
import org.onosproject.net.DeviceId;
import org.onosproject.net.Port;
import org.onosproject.net.device.DefaultPortDescription;
import org.onosproject.net.device.DeviceEvent;
import org.onosproject.net.device.DeviceListener;
import org.onosproject.net.device.DeviceProviderService;
import org.onosproject.net.device.DeviceService;
import org.onosproject.net.device.PortDescription;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Collection;
import java.util.List;

/**
 * Class manages gNMI subscription of devices with OpenConfig model.
 */
@Beta
public class GnmiDeviceStateSubscriber {

    private static final String LAST_CHANGE = "last-change";
    private static Logger log = LoggerFactory.getLogger(GnmiDeviceStateSubscriber.class);

    private final GnmiController gnmiController;
    private final DeviceService deviceService;
    private final DeviceProviderService providerService;
    private final MastershipService mastershipService;

    private InternalGnmiEventListener gnmiEventListener = new InternalGnmiEventListener();
    private InternalDeviceListener deviceEventListener = new InternalDeviceListener();
    private InternalMastershopListener mastershopListener = new InternalMastershopListener();
    private final Collection<DeviceId> deviceSubscribed = Sets.newHashSet();

    public GnmiDeviceStateSubscriber(GnmiController gnmiController, DeviceService deviceService,
                                     MastershipService mastershipService,
                                     DeviceProviderService providerService) {
        this.gnmiController = gnmiController;
        this.deviceService = deviceService;
        this.mastershipService = mastershipService;
        this.providerService = providerService;
        deviceService.addListener(deviceEventListener);
        mastershipService.addListener(mastershopListener);
        gnmiController.addListener(gnmiEventListener);
    }

    public void deactivate() {
        deviceSubscribed.clear();
        deviceService.removeListener(deviceEventListener);
        mastershipService.removeListener(mastershopListener);
        gnmiController.removeListener(gnmiEventListener);
    }

    public void checkDeviceSubscription(DeviceId deviceId) {
        synchronized (deviceSubscribed) {
            if (!mastershipService.isLocalMaster(deviceId)) {
                // Subscribe device status only on master instance
                if (deviceSubscribed.contains(deviceId)) {
                    // Unsubscribe device
                    unsubscribeDeviceStatus(deviceId);
                }
                return;
            }
            if (deviceSubscribed.contains(deviceId)) {
                // Already subscribed
                return;
            }
            if (!deviceService.isAvailable(deviceId)) {
                // Device not available
                return;
            }
            deviceSubscribed.add(deviceId);
            subscribeDevicePortStatus(deviceId);
        }
    }

    private Path interfaceOperStatusPath(String interfaceName) {
        return Path.newBuilder()
                .addElem(PathElem.newBuilder().setName("interfaces").build())
                .addElem(PathElem.newBuilder()
                        .setName("interface").putKey("name", interfaceName).build())
                .addElem(PathElem.newBuilder().setName("state").build())
                .addElem(PathElem.newBuilder().setName("oper-status").build())
                .build();
    }

    private void unsubscribeDeviceStatus(DeviceId deviceId) {
        GnmiClient client = gnmiController.getClient(deviceId);
        if (client == null) {
            log.debug("Cannot find gNMI client for device {}", deviceId);
            return;
        }
        client.terminateSubscriptionChannel();
        deviceSubscribed.remove(deviceId);
    }

    private void subscribeDevicePortStatus(DeviceId deviceId) {
        GnmiClient client = gnmiController.getClient(deviceId);
        if (client == null) {
            log.warn("Cannot find gNMI client for device {}", deviceId);
            return;
        }

        List<Port> ports = deviceService.getPorts(deviceId);
        SubscriptionList.Builder subscriptionList = SubscriptionList.newBuilder();
        subscriptionList.setMode(SubscriptionList.Mode.STREAM);
        subscriptionList.setUpdatesOnly(true);

        ports.forEach(port -> {
            String portName = port.number().name();
            // Subscribe /interface/interface[name=port-name]/state/oper-status
            Path subscribePath = interfaceOperStatusPath(portName);
            Subscription interfaceOperStatusSub =
                    Subscription.newBuilder()
                            .setPath(subscribePath)
                            .setMode(SubscriptionMode.ON_CHANGE)
                            .build();
            // TODO: more state subscription
            subscriptionList.addSubscription(interfaceOperStatusSub);
        });

        SubscribeRequest subscribeRequest = SubscribeRequest.newBuilder()
                .setSubscribe(subscriptionList.build())
                .build();

        client.subscribe(subscribeRequest);
    }

    private void handleGnmiUpdate(GnmiUpdate eventSubject) {
        Notification notification = eventSubject.update();
        if (notification == null) {
            log.warn("Cannot handle gNMI event without update data, abort");
            log.debug("gNMI update:\n{}", eventSubject);
            return;
        }

        List<Update> updateList = notification.getUpdateList();
        updateList.forEach(update -> {
            Path path = update.getPath();
            PathElem lastElem = path.getElem(path.getElemCount() - 1);

            // Use last element to identify which state updated
            switch (lastElem.getName()) {
                case "oper-status":
                    handleOperStatusUpdate(eventSubject.deviceId(), update, notification.getTimestamp());
                    break;
                default:
                    log.debug("Unrecognized update {}", GnmiUtils.pathToString(path));
            }
        });
    }

    private void handleOperStatusUpdate(DeviceId deviceId, Update update, long timestamp) {
        Path path = update.getPath();
        // first element should be "interface"
        String interfaceName = path.getElem(1).getKeyOrDefault("name", null);
        if (interfaceName == null) {
            log.error("No interface present in gNMI update, abort");
            log.debug("gNMI update:\n{}", update);
            return;
        }

        List<Port> portsFromDevice = deviceService.getPorts(deviceId);
        portsFromDevice.forEach(port -> {
            if (!port.number().name().equals(interfaceName)) {
                return;
            }

            DefaultAnnotations portAnnotations = DefaultAnnotations.builder()
                    .putAll(port.annotations())
                    .set(LAST_CHANGE, String.valueOf(timestamp))
                    .build();

            // Port/Interface name is identical in OpenConfig model, but not in ONOS
            // This might cause some problem if we use one name to different port
            PortDescription portDescription = DefaultPortDescription.builder()
                    .portSpeed(port.portSpeed())
                    .withPortNumber(port.number())
                    .isEnabled(update.getVal().getStringVal().equals("UP"))
                    .type(port.type())
                    .annotations(portAnnotations)
                    .build();
            providerService.portStatusChanged(deviceId, portDescription);
        });
    }

    class InternalGnmiEventListener implements GnmiEventListener {

        @Override
        public void event(GnmiEvent event) {
            log.debug("Receive gNMI event {}", event.toString());
            GnmiEventSubject eventSubject = event.subject();
            switch (event.type()) {
                case UPDATE:
                    handleGnmiUpdate((GnmiUpdate) eventSubject);
                    break;
                default:
                    log.warn("Unsupported gNMI event type: {}", event.type());
            }
        }

        @Override
        public boolean isRelevant(GnmiEvent event) {
            return deviceSubscribed.contains(event.subject().deviceId());
        }
    }

    class InternalMastershopListener implements MastershipListener {

        @Override
        public void event(MastershipEvent event) {
            checkDeviceSubscription(event.subject());
        }
    }

    class InternalDeviceListener implements DeviceListener {

        @Override
        public void event(DeviceEvent event) {
            switch (event.type()) {
                case DEVICE_ADDED:
                case DEVICE_AVAILABILITY_CHANGED:
                case DEVICE_UPDATED:
                    checkDeviceSubscription(event.subject().id());
                    break;
                case DEVICE_REMOVED:
                    deviceSubscribed.remove(event.subject().id());
                    break;
                default:
                    break;
            }
        }
    }
}
