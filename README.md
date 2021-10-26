# Multi-Node Demos for Running Kafka in KRAFT mode (without Zookeeper)

Warning: KRAFT mode is not production ready, please see the official Apache Kafka documentation why it is currently strongly adviced not to run this in production. 

## Combined mode

Within the `three-node-cluster-combined` mode, a cluster is spun up with three jvm processes, each running both as a controller and as a broker. 

Note that this is not the recommended setup. 

## Separated Controllers and Brokers

Within the `three-node-cluster-separate` directory a cluster is spun up with three jvm processes for the controllers, and three jvm processes for the brokers. 
Note that the server.properties configuration for the two types of processes differs significantly. 

## Prerequisites

* Local installation of Confluent Platform 6.2.1. 
* JAVA 11
* Linux or MacOS environment for running the scripts
* Kafka cli tools on the PATH: kafka-topics, kafka-producer-perf-test, kafka-metadata-shell, kafka-storage, kafka-server-start

## Running the demos

* Enter the directory of the demo
* inspect the server.properties files
* start the cluster: `./start-cluster.sh`
* Inspect the log files for errors and to see when the cluster is up and running: `less server1.log`; `less server2.log`; etc
* produce some sample data: `./test-produce.sh`
* Inspect the metadata which is now stored in Kafka itself (!): `./run-metadata-shell.sh`. Use the `ls` and `cat` commands to see the nodes and content (e.g. topic configurations). 

