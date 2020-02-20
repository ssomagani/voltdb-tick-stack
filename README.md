# voltdb-tickstack

## What this does
1. Telegraf queries statistics from VoltDB
2. Telegraf inserts the data into the InfluxDB instance
3. Chronograf queries InfluxDB to generate graphs over VoltDB statistics
4. Users can customize/build graphs for their monitoring needs
5. Kapacitor is not included yet

## Running Instructions

### Docker Instructions

### Monitor an existing VoltDB cluster

1. Configure - `telegraf.conf` to update the connStrings variable to connect to your VoltDB instance.
2. Run - `docker compose docker-compose.tick.yml up` to start up the TICK stack containers.
3. Open - http://localhost:8888/ to launch Chronograf
4. Customize - any of the included dashboards (.json files) from the Chronograf UI (http://localhost:8888/sources/0/dashboards -> Import Dashboard). Refer to "Using and Creagint Dashboards" for more details.

### Create a new VoltDB cluster, run voter example and monitor

## Purpose

To help monitoring VoltDB for performance, 

## Using and creating Dashboards

Some dashboards are provided as guides

### Transactions Global
### Transactions by Procedure
### Transactions by Site

## Help

If you need any help, please reach out by email or Slack (seeta in voltdb-public.slack.com)
