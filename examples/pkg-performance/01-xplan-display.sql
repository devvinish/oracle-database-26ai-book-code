explain plan for
select f.flight_no, r.origin, r.destination
from   flights f join routes r on r.route_id = f.route_id
where  f.flight_id = 1000;

select plan_table_output
from   table(dbms_xplan.display(format => 'BASIC +PREDICATE +ROWS'));
