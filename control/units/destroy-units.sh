#!/bin/bash

if [ -z "$FLEETCTL_TUNNEL" ]; then
    echo
    echo "You must set FLEETCTL_TUNNEL (a resolvable address to one of your CoreOS instances)"
    echo "e.g.:"
    echo "export FLEETCTL_TUNNEL=1.2.3.4"
    echo
    exit 1
fi

SCRIPT_PATH=$( cd $(dirname $0) ; pwd -P )
cd $SCRIPT_PATH

echo "Unregistering units"
echo "==================="
fleetctl destroy vulcand{,.elb,.presence}
fleetctl destroy logstash{,.presence}@
fleetctl destroy elasticsearch{,.presence}@
fleetctl destroy syslog_gollector
fleetctl destroy kafka{,.presence}@
fleetctl destroy zookeeper{,.presence}@
fleetctl destroy sysinfo_influxdb
fleetctl destroy cadvisor
# fleetctl destroy influxdb.create_db
fleetctl destroy influxdb{,.elb,.presence}@
fleetctl destroy skydns
fleetctl destroy registrator
fleetctl destroy logspout
