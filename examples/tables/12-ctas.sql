-- @setup drop table if exists route_summary purge
create table route_summary as
select r.origin, count(*) as routes, max(r.distance_km) as longest_km
from   routes r
group  by r.origin;

select * from route_summary where routes > 2;
-- @cleanup drop table if exists route_summary purge
