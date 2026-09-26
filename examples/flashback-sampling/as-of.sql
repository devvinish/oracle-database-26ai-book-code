-- @setup drop table if exists fares_demo purge
-- @setup create table fares_demo as select route_id, distance_km, 100 as base_fare from routes where route_id <= 3
-- @setup begin dbms_session.sleep(10); end;
select route_id, base_fare from fares_demo;

update fares_demo set base_fare = base_fare * 2;
commit;

select route_id, base_fare from fares_demo;

select route_id, base_fare
from   fares_demo as of timestamp (systimestamp - interval '1' second);
-- @cleanup drop table if exists fares_demo purge
-- @cleanup drop table if exists sys_temp_fbt purge
