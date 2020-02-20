# voltdb-tickstack

## What this does
1. Telegraf queries statistics from VoltDB
2. Telegraf inserts the data into the InfluxDB instance
3. Chronograf queries InfluxDB to generate graphs over VoltDB statistics
4. Users can customize/build graphs for their monitoring needs
5. Kapacitor is not included yet

## Running Instructions

**Monitor an existing VoltDB cluster**

1. Configure - [telegraf.conf](telegraf.conf) to update the connStrings variable to connect to your VoltDB instance.
2. Run       - `docker compose docker-compose.tick.yml up` to start up the TICK stack containers.
3. Open      - http://localhost:8888/ to launch Chronograf
4. Customize - any of the included dashboards (.json files) from the Chronograf UI (http://localhost:8888/sources/0/dashboards -> Import Dashboard). Refer to [Using and Creating Dashboards] for more details.

**Create a new VoltDB cluster**

1. Configure - `telegraf.conf` to update the connStrings variable to connect to your VoltDB instance.
2. Run       - `docker compose docker-compose.all.yml up` to start up the TICK stack, a 3-node VoltDB cluster and a VoltDB client running the voter example.
3. Open      - [http://localhost:8888/] to launch Chronograf
4. Customize - any of the included dashboards (.json files) from the Chronograf UI (http://localhost:8888/sources/0/dashboards -> Import Dashboard). Refer to [Using and Creating Dashboards] for more details.
 
## Purpose

Being able to observe the same metric with context at different points on the path of transactions through VoltDB should help identify bottlenecks. The typical bottlenecks to performance that we have found from experience are 

**Static**
* MP transactions - Sometimes, even a low overall % of execution of MP procedures can cause disproportionate delays by blocking other SP transactions. 
* Suboptimal Stored Procedures - Frequently, the SQL Plans give extremely valuable information to optimize the processing closest to the actual execution and must be checked.
* Payload size - In addition to the network delay for transmission, the CPU time needed to process large payloads could be a bottleneck and must be checked.

**Dynamic**
* Workload skew over sites - Some sites have disproportionately high or low load causing bottlenecks on a host or on a client connection.
* Slow clients - If clients are not able to submit work efficiently (using synchronous procedural logic in the client; exhausting resources on the client host; etc) VoltDB server sites can be starved and not generate the desired performance.



## Using and creating Dashboards

Some dashboards are provided as guides

### Transactions Global

**Template Variables**
The template variables are used by the queries behind the graphs on this dashboard.
* `divide_by_interval` - The time interval in seconds to divide the SUM(some_metric) by to get the metrics per second. It is usually set to 5s, but update this variable when changing the dashboard graphing interval.
* `ignore_MP_site` - The MP site (on a single node) is a special site that shouldn't be clumped together with the others when gathering metrics, so this template variable can be set to the site_id of the MP (it's usually the highest number of SITE_ID, but you can verify that by comparing the ideltime between different sites). In the case of a multi-node cluster, update the query behind the graphs to ensure that the MP sites from all the nodes are excluded from the aggregations.

### Transactions by Procedure
This dashboard shows the graphs specific to a procedure.

**Template Variables**
Set the `proc_name` variable to filter to the procedure name.

### Transactions by Site
This dashboard shows the graphs specific to a site.
## Help

If you need any help, please reach out by email or Slack (seeta in voltdb-public.slack.com)
