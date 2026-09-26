-- @setup drop cluster if exists route_cluster including tables
create cluster route_cluster (route_id number) size 1024;
create index route_cluster_ix on cluster route_cluster;

create table route_headers cluster route_cluster (route_id)
  as select route_id, origin, destination from routes;
create table route_flights cluster route_cluster (route_id)
  as select flight_id, route_id, flight_no from flights;

select table_name, cluster_name from user_tables where cluster_name = 'ROUTE_CLUSTER';
-- @cleanup drop cluster if exists route_cluster including tables
