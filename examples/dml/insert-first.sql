-- @setup drop table if exists route_bands purge
-- @setup create table route_bands (band varchar2(10), route_id number)
insert first
  when distance_km >= 10000 then into route_bands values ('ULTRA', route_id)
  when distance_km >= 5000  then into route_bands values ('LONG', route_id)
  else                           into route_bands values ('SHORT', route_id)
select route_id, distance_km from routes;

select band, count(*) as routes from route_bands group by band order by routes;
-- @cleanup drop table if exists route_bands purge
