-- @setup drop materialized view if exists route_revenue_mv
create materialized view route_revenue_mv
  build immediate
  refresh complete on demand
  enable query rewrite
as
select f.route_id, t.cabin, count(*) as tickets, sum(t.fare) as revenue
from   tickets t join flights f on f.flight_id = t.flight_id
group  by f.route_id, t.cabin;

select mview_name, refresh_mode, refresh_method, staleness, rewrite_enabled
from   user_mviews;
