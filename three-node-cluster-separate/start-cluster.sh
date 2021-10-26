#!/bin/bash

set -e -u

echo Cleaning up previous runs
rm -rf /tmp/server{1,2,3,4,5,6}
rm -f server{1,2,3,4,5,6}.log

echo Generating cluster id
CLUSTER_ID=$(kafka-storage random-uuid)
echo "Generated cluster id: $CLUSTER_ID"

for i in 1 2 3 4 5 6; do 
  echo Starting Server $i
  kafka-storage format -t $CLUSTER_ID -c server$i.properties
  kafka-server-start server$i.properties > server$i.log 2>&1 &
done

