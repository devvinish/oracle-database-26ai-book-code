-- @setup create or replace function route_minutes (p_origin varchar2) return number is n number; begin select sum(block_minutes) into n from routes where origin = p_origin; return n; end;
declare
  v_trace number;
  v_run   number;
  v_total number := 0;
begin
  dbms_hprof.create_tables(force_it => true);          -- DBMSHP_ tables in this schema
  v_trace := dbms_hprof.start_profiling;               -- profile into the database
  for a in (select airport_code from airports) loop
    v_total := v_total + nvl(route_minutes(a.airport_code), 0);
  end loop;
  dbms_hprof.stop_profiling;
  v_run := dbms_hprof.analyze(trace_id => v_trace, run_comment => 'route minutes');
  dbms_output.put_line('total ' || v_total);
end;
/
select function, calls
from   dbmshp_function_info
where  runid = (select max(runid) from dbmshp_runs)
and    calls > 1
order  by calls desc, function;
-- @cleanup drop function if exists route_minutes
