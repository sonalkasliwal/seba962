UTILS = [
    "//utils/osgiwrap:osgi-jar",
    "//utils/osgi:onlab-osgi",
    "//utils/junit:onlab-junit",
    "//utils/misc:onlab-misc",
    "//utils/rest:onlab-rest",
]

API = [
    "//core/api:onos-api",
    "//incubator/api:onos-incubator-api",
]

CORE = UTILS + API + [
    "//core/net:onos-core-net",
    "//core/common:onos-core-common",
    "//core/store/primitives:onos-core-primitives",
    "//core/store/serializers:onos-core-serializers",
    "//core/store/dist:onos-core-dist",
    "//core/security:onos-security",
    "//core/store/persistence:onos-core-persistence",
    "//incubator/net:onos-incubator-net",
    "//incubator/store:onos-incubator-store",
    "//incubator/rpc:onos-incubator-rpc",
    "//cli:onos-cli",
    "//protocols/rest/api:onos-protocols-rest-api",
    "//protocols/rest/ctl:onos-protocols-rest-ctl",
    "//protocols/bgp/bgpio:onos-protocols-bgp-bgpio",
    "//protocols/bgp/api:onos-protocols-bgp-api",
    "//protocols/bgp/ctl:onos-protocols-bgp-ctl",
    "//protocols/netconf/api:onos-protocols-netconf-api",
    "//protocols/netconf/ctl:onos-protocols-netconf-ctl",
    "//protocols/openflow/api:onos-protocols-openflow-api",
    "//protocols/openflow/ctl:onos-protocols-openflow-ctl",
    "//protocols/ospf/api:onos-protocols-ospf-api",
    "//protocols/ospf/protocol:onos-protocols-ospf-protocol",
    "//protocols/ospf/ctl:onos-protocols-ospf-ctl",
    "//protocols/ovsdb/rfc:onos-protocols-ovsdb-rfc",
    "//protocols/ovsdb/api:onos-protocols-ovsdb-api",
    "//protocols/ovsdb/ctl:onos-protocols-ovsdb-ctl",
    "//protocols/p4runtime/api:onos-protocols-p4runtime-api",
    "//protocols/p4runtime/model:onos-protocols-p4runtime-model",
    "//protocols/pcep/pcepio:onos-protocols-pcep-pcepio",
    "//protocols/pcep/server/api:onos-protocols-pcep-server-api",
    "//protocols/pcep/server/ctl:onos-protocols-pcep-server-ctl",
    "//protocols/snmp/api:onos-protocols-snmp-api",
    "//protocols/snmp/ctl:onos-protocols-snmp-ctl",
    "//protocols/isis/api:onos-protocols-isis-api",
    "//protocols/isis/ctl:onos-protocols-isis-ctl",
    "//protocols/isis/isisio:onos-protocols-isis-isisio",
    "//protocols/lisp/api:onos-protocols-lisp-api",
    "//protocols/lisp/ctl:onos-protocols-lisp-ctl",
    "//protocols/lisp/msg:onos-protocols-lisp-msg",
    "//protocols/tl1/api:onos-protocols-tl1-api",
    "//protocols/tl1/ctl:onos-protocols-tl1-ctl",
    "//protocols/restconf/client/api:onos-protocols-restconf-client-api",
    "//protocols/restconf/client/ctl:onos-protocols-restconf-client-ctl",
    "//protocols/xmpp/core/api:onos-protocols-xmpp-core-api",
    "//protocols/xmpp/core/ctl:onos-protocols-xmpp-core-ctl",
    "//drivers/utilities:onos-drivers-utilities",
    "//providers/netconf/device:onos-providers-netconf-device",
    "//providers/openflow/device:onos-providers-openflow-device",
    "//providers/openflow/packet:onos-providers-openflow-packet",
    "//providers/openflow/flow:onos-providers-openflow-flow",
    "//providers/openflow/group:onos-providers-openflow-group",
    "//providers/openflow/meter:onos-providers-openflow-meter",
    "//providers/ovsdb/device:onos-providers-ovsdb-device",
    "//providers/ovsdb/tunnel:onos-providers-ovsdb-tunnel",
    "//providers/rest/device:onos-providers-rest-device",
    "//providers/snmp/device:onos-providers-snmp-device",
    "//providers/isis/cfg:onos-providers-isis-cfg",
    "//providers/isis/topology:onos-providers-isis-topology",
    "//providers/lisp/device:onos-providers-lisp-device",
    "//providers/tl1/device:onos-providers-tl1-device",
    "//providers/general/device:onos-providers-general-device",
    "//providers/p4runtime/packet:onos-providers-p4runtime-packet",
    "//web/api:onos-rest",
    "//web/gui2:onos-gui2",
    "//web/gui:onos-gui",
    # "//incubator/protobuf/models:onos-incubator-protobuf-models",
    # "//incubator/protobuf/services/nb:onos-incubator-protobuf-services-nb",
]

ONOS_DRIVERS = [
    # Drivers
    "//drivers/default:onos-drivers-default-oar",
    "//drivers/arista:onos-drivers-arista-oar",
    "//drivers/ciena/waveserver:onos-drivers-ciena-waveserver-oar",
    "//drivers/ciena/c5162:onos-drivers-ciena-c5162-oar",
    "//drivers/ciena/c5170:onos-drivers-ciena-c5170-oar",
    "//drivers/ciena/waveserverai:onos-drivers-ciena-waveserverai-oar",
    "//drivers/cisco/netconf:onos-drivers-cisco-netconf-oar",
    "//drivers/cisco/rest:onos-drivers-cisco-rest-oar",
    "//drivers/corsa:onos-drivers-corsa-oar",
    "//drivers/fujitsu:onos-drivers-fujitsu-oar",
    "//drivers/lumentum:onos-drivers-lumentum-oar",
    "//drivers/netconf:onos-drivers-netconf-oar",
    "//drivers/server:onos-drivers-server-oar",
    "//drivers/optical:onos-drivers-optical-oar",
    "//drivers/ovsdb:onos-drivers-ovsdb-oar",
    "//drivers/juniper:onos-drivers-juniper-oar",
    "//drivers/lisp:onos-drivers-lisp-oar",
    "//drivers/flowspec:onos-drivers-flowspec-oar",
    "//drivers/huawei:onos-drivers-huawei-oar",
    "//drivers/microsemi/ea1000:onos-drivers-microsemi-ea1000-oar",
    "//drivers/oplink:onos-drivers-oplink-oar",
    "//drivers/bmv2:onos-drivers-bmv2-oar",
    "//drivers/barefoot:onos-drivers-barefoot-oar",
    "//drivers/mellanox:onos-drivers-mellanox-oar",
    "//drivers/hp:onos-drivers-hp-oar",
    "//drivers/p4runtime:onos-drivers-p4runtime-oar",
    "//drivers/gnmi:onos-drivers-gnmi-oar",
    "//drivers/polatis/netconf:onos-drivers-polatis-netconf-oar",
    "//drivers/polatis/openflow:onos-drivers-polatis-openflow-oar",
    "//drivers/odtn-driver:onos-drivers-odtn-driver-oar",
    "//drivers/stratum:onos-drivers-stratum-oar",
]

ONOS_PROVIDERS = [
    # Providers
    "//providers/bgp:onos-providers-bgp-oar",
    "//providers/bgpcep:onos-providers-bgpcep-oar",
    "//providers/host:onos-providers-host-oar",
    "//providers/hostprobing:onos-providers-hostprobing-oar",
    "//providers/lldp:onos-providers-lldp-oar",
    "//providers/netcfghost:onos-providers-netcfghost-oar",
    "//providers/netcfglinks:onos-providers-netcfglinks-oar",
    "//providers/netconf:onos-providers-netconf-oar",
    "//providers/openflow/message:onos-providers-openflow-message-oar",
    "//providers/ovsdb:onos-providers-ovsdb-oar",
    "//providers/ovsdb/host:onos-providers-ovsdb-host-oar",
    "//providers/ovsdb/base:onos-providers-ovsdb-base-oar",
    "//providers/pcep:onos-providers-pcep-oar",
    "//providers/null:onos-providers-null-oar",
    "//providers/openflow/base:onos-providers-openflow-base-oar",
    "//providers/openflow/app:onos-providers-openflow-app-oar",
    "//providers/rest:onos-providers-rest-oar",
    "//providers/isis:onos-providers-isis-oar",
    "//providers/snmp:onos-providers-snmp-oar",
    "//providers/link:onos-providers-link-oar",
    "//providers/lisp:onos-providers-lisp-oar",
    "//providers/tl1:onos-providers-tl1-oar",
    "//providers/general:onos-providers-general-oar",
    "//providers/p4runtime:onos-providers-p4runtime-oar",
    # "//providers/ietfte:onos-providers-ietfte-oar",
    "//providers/xmpp/device:onos-providers-xmpp-device-oar",
]

ONOS_APPS = [
    # Apps
    "//apps/dhcp:onos-apps-dhcp-oar",
    "//apps/dhcprelay:onos-apps-dhcprelay-oar",
    "//apps/fwd:onos-apps-fwd-oar",
    "//apps/packet-stats:onos-apps-packet-stats-oar",
    "//apps/acl:onos-apps-acl-oar",
    "//apps/bgprouter:onos-apps-bgprouter-oar",
    "//apps/cip:onos-apps-cip-oar",
    "//apps/drivermatrix:onos-apps-drivermatrix-oar",
    "//apps/events:onos-apps-events-oar",
    "//apps/proxyarp:onos-apps-proxyarp-oar",
    "//apps/segmentrouting:onos-apps-segmentrouting-oar",
    "//apps/gangliametrics:onos-apps-gangliametrics-oar",
    "//apps/graphitemetrics:onos-apps-graphitemetrics-oar",
    "//apps/flowanalyzer:onos-apps-flowanalyzer-oar",
    "//apps/intentsync:onos-apps-intentsync-oar",
    "//apps/influxdbmetrics:onos-apps-influxdbmetrics-oar",
    "//apps/metrics:onos-apps-metrics-oar",
    "//apps/mfwd:onos-apps-mfwd-oar",
    "//apps/mlb:onos-apps-mlb-oar",
    "//apps/mobility:onos-apps-mobility-oar",
    "//apps/newoptical:onos-apps-newoptical-oar",
    "//apps/optical-model:onos-apps-optical-model-oar",
    "//apps/optical-rest:onos-apps-optical-rest-oar",
    "//apps/pathpainter:onos-apps-pathpainter-oar",
    "//apps/pcep-api:onos-apps-pcep-api-oar",
    "//apps/pim:onos-apps-pim-oar",
    "//apps/linkprops:onos-apps-linkprops-oar",
    "//apps/reactive-routing:onos-apps-reactive-routing-oar",
    "//apps/roadm:onos-apps-roadm-oar",
    "//apps/sdnip:onos-apps-sdnip-oar",
    "//apps/test/cluster-ha:onos-apps-test-cluster-ha-oar",
    "//apps/test/demo:onos-apps-test-demo-oar",
    "//apps/test/distributed-primitives:onos-apps-test-distributed-primitives-oar",
    "//apps/test/election:onos-apps-test-election-oar",
    "//apps/test/flow-perf:onos-apps-test-flow-perf-oar",
    "//apps/test/intent-perf:onos-apps-test-intent-perf-oar",
    "//apps/test/route-scale:onos-apps-test-route-scale-oar",
    "//apps/test/loadtest:onos-apps-test-loadtest-oar",
    "//apps/test/netcfg-monitor:onos-apps-test-netcfg-monitor-oar",
    "//apps/test/messaging-perf:onos-apps-test-messaging-perf-oar",
    "//apps/test/primitive-perf:onos-apps-test-primitive-perf-oar",
    "//apps/test/transaction-perf:onos-apps-test-transaction-perf-oar",
    "//apps/virtualbng:onos-apps-virtualbng-oar",
    "//apps/vpls:onos-apps-vpls-oar",
    "//apps/vrouter:onos-apps-vrouter-oar",
    "//apps/routing/fibinstaller:onos-apps-routing-fibinstaller-oar",
    "//apps/routing/cpr:onos-apps-routing-cpr-oar",
    "//apps/routing/fpm:onos-apps-routing-fpm-oar",
    "//apps/vtn:onos-apps-vtn-oar",
    "//apps/faultmanagement:onos-apps-faultmanagement-oar",
    "//apps/openstacknode:onos-apps-openstacknode-oar",
    "//apps/openstacknetworking:onos-apps-openstacknetworking-oar",
    "//apps/openstacknetworkingui:onos-apps-openstacknetworkingui-oar",
    "//apps/openstacktelemetry:onos-apps-openstacktelemetry-oar",
    "//apps/openstacktroubleshoot:onos-apps-openstacktroubleshoot-oar",
    "//apps/openstackvtap:onos-apps-openstackvtap-oar",
    "//apps/cpman/app:onos-apps-cpman-app-oar",
    "//apps/scalablegateway:onos-apps-scalablegateway-oar",
    "//apps/castor:onos-apps-castor-oar",
    # "//apps/yms:onos-apps-yms-oar",
    "//apps/ofagent:onos-apps-ofagent-oar",
    "//apps/mappingmanagement:onos-apps-mappingmanagement-oar",
    "//apps/config:onos-apps-config-oar",
    "//apps/configsync:onos-apps-configsync-oar",
    "//apps/configsync-netconf:onos-apps-configsync-netconf-oar",
    "//apps/netconf/client:onos-apps-netconf-client-oar",
    "//apps/tetopology:onos-apps-tetopology-oar",
    "//apps/tetunnel:onos-apps-tetunnel-oar",
    # "//apps/tenbi/yangmodel:onos-apps-tenbi-yangmodel-feature",
    # "//apps/tenbi:onos-apps-tenbi-oar",
    "//protocols/restconf/server:onos-protocols-restconf-server-oar",
    "//apps/restconf:onos-apps-restconf-oar",
    "//apps/flowspec-api:onos-apps-flowspec-api-oar",
    "//apps/yang:onos-apps-yang-oar",
    "//apps/yang-gui:onos-apps-yang-gui-oar",
    "//apps/cord-support:onos-apps-cord-support-oar",
    "//apps/network-troubleshoot:onos-apps-network-troubleshoot-oar",
    "//apps/l3vpn:onos-apps-l3vpn-oar",
    "//apps/openroadm:onos-apps-openroadm-oar",
    "//apps/artemis:onos-apps-artemis-oar",
    "//apps/pi-demo/ecmp:onos-apps-pi-demo-ecmp-oar",
    "//apps/gluon:onos-apps-gluon-oar",
    "//apps/evpnopenflow:onos-apps-evpnopenflow-oar",
    "//apps/route-service:onos-apps-route-service-oar",
    "//apps/evpn-route-service:onos-apps-evpn-route-service-oar",
    # "//incubator/protobuf/registry:onos-incubator-protobuf-registry-oar",
    # "//incubator/protobuf/services/nb:onos-incubator-protobuf-services-nb-oar",
    "//apps/p4-tutorial/pipeconf:onos-apps-p4-tutorial-pipeconf-oar",
    "//apps/p4-tutorial/mytunnel:onos-apps-p4-tutorial-mytunnel-oar",
    "//apps/cfm:onos-apps-cfm-oar",
    "//apps/routeradvertisement:onos-apps-routeradvertisement-oar",
    "//apps/powermanagement:onos-apps-powermanagement-oar",
    "//apps/t3:onos-apps-t3-oar",
    "//apps/simplefabric:onos-apps-simplefabric-oar",
    # "//apps/kafka-integration:onos-apps-kafka-integration-oar",
    "//apps/rabbitmq:onos-apps-rabbitmq-oar",
    "//apps/odtn/api:onos-apps-odtn-api-oar",
    "//apps/odtn/service:onos-apps-odtn-service-oar",
    "//apps/mcast:onos-apps-mcast-oar",
    "//apps/layout:onos-apps-layout-oar",
    "//apps/imr:onos-apps-imr-oar",
    "//apps/nodemetrics:onos-apps-nodemetrics-oar",
    "//apps/inbandtelemetry:onos-apps-inbandtelemetry-oar",
    # "//web/gui2:onos-web-gui2-oar",
    "//apps/workflow:onos-apps-workflow-oar",
]

PROTOCOL_APPS = [
    "//protocols/grpc:onos-protocols-grpc-oar",
    "//protocols/p4runtime:onos-protocols-p4runtime-oar",
    "//protocols/gnmi:onos-protocols-gnmi-oar",
    "//protocols/xmpp/core:onos-protocols-xmpp-core-oar",
    "//protocols/xmpp/pubsub:onos-protocols-xmpp-pubsub-oar",
]

MODELS = [
    "//models/ietf:onos-models-ietf-oar",
    "//models/common:onos-models-common-oar",
    "//models/huawei:onos-models-huawei-oar",
    "//models/openconfig:onos-models-openconfig-oar",
    "//models/openconfig-infinera:onos-models-openconfig-infinera-oar",
    "//models/openroadm:onos-models-openroadm-oar",
    "//models/tapi:onos-models-tapi-oar",
    "//models/l3vpn:onos-models-l3vpn-oar",
    "//models/microsemi:onos-models-microsemi-oar",
    "//models/polatis:onos-models-polatis-oar",
    "//models/ciena/waveserverai:onos-models-ciena-waveserverai-oar",
]

PIPELINES = [
    "//pipelines/basic:onos-pipelines-basic-oar",
    "//pipelines/fabric:onos-pipelines-fabric-oar",
]

APP_JARS = [
    "//apps/cpman/api:onos-apps-cpman-api",
    "//apps/routing-api:onos-apps-routing-api",
    "//apps/dhcp/api:onos-apps-dhcp-api",
    "//apps/dhcp/app:onos-apps-dhcp-app",
    "//apps/imr/api:onos-apps-imr-api",
    "//apps/imr/app:onos-apps-imr-app",
    "//apps/dhcprelay/app:onos-apps-dhcprelay-app",
    "//apps/dhcprelay/web:onos-apps-dhcprelay-web",
    "//apps/fwd:onos-apps-fwd",
    "//apps/iptopology-api:onos-apps-iptopology-api",
    "//apps/routing/common:onos-apps-routing-common",
    "//apps/vtn/vtnrsc:onos-apps-vtn-vtnrsc",
    "//apps/vtn/sfcmgr:onos-apps-vtn-sfcmgr",
    "//apps/vtn/vtnmgr:onos-apps-vtn-vtnmgr",
    "//apps/vtn/vtnweb:onos-apps-vtn-vtnweb",
    "//apps/kafka-integration/api:onos-apps-kafka-integration-api",
    # "//apps/kafka-integration/app:onos-apps-kafka-integration-app",
]

FEATURES = [
    "//tools/package/features:onos-thirdparty-base",
    "//tools/package/features:onos-thirdparty-web",
    "//tools/package/features:onos-api",
    "//tools/package/features:onos-core",
    "//tools/package/features:onos-incubator",
    "//tools/package/features:onos-cli",
    "//tools/package/features:onos-rest",
    "//tools/package/features:onos-gui",
    "//tools/package/features:onos-gui2",
    "//tools/package/features:onos-security",
]

APPS = ONOS_DRIVERS + ONOS_PROVIDERS + ONOS_APPS + MODELS + PIPELINES + \
       PROTOCOL_APPS + APP_JARS
