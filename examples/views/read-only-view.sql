-- @expect-error
create or replace view public_fares as
select route_id, cabin, round(avg(fare)) as typical_fare
from   tickets join flights using (flight_id)
group  by route_id, cabin
with read only;

delete from public_fares;
