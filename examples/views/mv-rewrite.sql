explain plan for
select f.route_id, sum(t.fare) as revenue
from   tickets t join flights f on f.flight_id = t.flight_id
group  by f.route_id;

select operation, options, object_name
from   plan_table
where  plan_id = (select max(plan_id) from plan_table)
order  by id;
