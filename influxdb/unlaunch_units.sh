#!/bin/bash

SCRIPT_PATH=$( cd $(dirname $0) ; pwd -P )
cd $SCRIPT_PATH

# influxdb service instances
# fleetctl destroy influxdb.data@1
# fleetctl destroy influxdb.create_db@1
fleetctl destroy influxdb.presence@1
fleetctl destroy influxdb.elb@1
fleetctl destroy influxdb@1

# fleetctl destroy influxdb.data@.service
# fleetctl destroy influxdb.create_db@.service
fleetctl destroy influxdb.presence@.service
fleetctl destroy influxdb.elb@.service
fleetctl destroy influxdb@.service
