update tickets set fare = fare + 1 where ticket_id = 1;
commit;

select mview_name, staleness from user_mviews where mview_name = 'ROUTE_REVENUE_MV';

exec dbms_mview.refresh('ROUTE_REVENUE_MV', method => 'C')

select mview_name, staleness, to_char(last_refresh_date, 'HH24:MI') is not null as refreshed
from   user_mviews where mview_name = 'ROUTE_REVENUE_MV';
-- @cleanup update tickets set fare = fare - 1 where ticket_id = 1
-- @cleanup commit
