-- @setup drop table if exists crew_copy purge
-- @setup create table crew_copy as select * from crew_assignments where 1 = 0
declare
  type t_crew is table of crew_assignments%rowtype;
  v_crew  t_crew;
  v_start timestamp;
  function ms_since (p_start timestamp) return number is
  begin
    return round(extract(second from (localtimestamp - p_start)) * 1000);
  end;
begin
  select * bulk collect into v_crew from crew_assignments;

  v_start := localtimestamp;
  for i in 1 .. v_crew.count loop
    insert into crew_copy values v_crew(i);                -- one statement per row
  end loop;
  dbms_output.put_line(v_crew.count || ' rows, row by row: ' || ms_since(v_start) || ' ms');
  rollback;

  v_start := localtimestamp;
  forall i in 1 .. v_crew.count
    insert into crew_copy values v_crew(i);                -- one statement for all rows
  dbms_output.put_line(v_crew.count || ' rows, FORALL:     ' || ms_since(v_start) || ' ms');
  rollback;
end;
/
-- @cleanup drop table if exists crew_copy purge
