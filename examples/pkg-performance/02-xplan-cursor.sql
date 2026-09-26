set serveroutput off
-- (with SERVEROUTPUT ON, SQLcl runs its own block after each statement to read DBMS_OUTPUT,
-- and DISPLAY_CURSOR would show the plan of that block)
select /*+ gather_plan_statistics */ count(*) as tickets
from   tickets t join flights f on f.flight_id = t.flight_id
where  f.status = 'CANCELLED';

-- the plan of the last statement of this session, with actual row counts
select plan_table_output
from   table(dbms_xplan.display_cursor(format => 'BASIC +PREDICATE +ROWSTATS LAST'));
set serveroutput on
