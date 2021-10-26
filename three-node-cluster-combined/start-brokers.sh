#!/bin/bash

set -e -u

echo Cleaning up previous runs
rm -rf /tmp/server{1,2,3}
rm -f server{1,2,3}.log

echo Generating cluster id
CLUSTER_ID=$(kafka-storage random-uuid)
echo "Generated cluster id: $CLUSTER_ID"

echo Formatting data directories
kafka-storage format -t $CLUSTER_ID -c server1.properties
kafka-storage format -t $CLUSTER_ID -c server2.properties
kafka-storage format -t $CLUSTER_ID -c server3.properties

echo Starting Server 1
kafka-server-start server1.properties > server1.log 2>&1 &
echo Starting Server 2
kafka-server-start server2.properties > server2.log 2>&1 &
echo Starting Server 3
kafka-server-start server3.properties > server3.log 2>&1 &

