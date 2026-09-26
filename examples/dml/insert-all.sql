-- @setup drop table if exists long_haul purge
-- @setup drop table if exists short_haul purge
-- @setup create table long_haul as select route_id, origin, destination, distance_km from routes where 1 = 0
-- @setup create table short_haul as select route_id, origin, destination, distance_km from routes where 1 = 0
insert all
  when distance_km >= 7000 then
    into long_haul  values (route_id, origin, destination, distance_km)
  when distance_km <  4000 then
    into short_haul values (route_id, origin, destination, distance_km)
select route_id, origin, destination, distance_km from routes;

select (select count(*) from long_haul)  as long_haul,
       (select count(*) from short_haul) as short_haul;
-- @cleanup drop table if exists long_haul purge
-- @cleanup drop table if exists short_haul purge
