-- @setup drop materialized view if exists cabin_totals_mv
-- @setup drop materialized view log if exists on tickets
create materialized view log on tickets
  with rowid, sequence (cabin, fare) including new values;

create materialized view cabin_totals_mv
  refresh fast on commit
as
select cabin, count(*) as tickets, count(fare) as fares, sum(fare) as revenue
from   tickets
group  by cabin;

select cabin, revenue from cabin_totals_mv order by cabin;

update tickets set fare = fare + 100 where ticket_id = 1;
commit;

select cabin, revenue from cabin_totals_mv order by cabin;
-- @cleanup update tickets set fare = fare - 100 where ticket_id = 1
-- @cleanup commit
-- @cleanup drop materialized view if exists cabin_totals_mv
-- @cleanup drop materialized view log if exists on tickets
