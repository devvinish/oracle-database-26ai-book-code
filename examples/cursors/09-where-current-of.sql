declare
  cursor c_late is
    select flight_id, status from flights
    where  route_id = 1 and status = 'SCHEDULED'
    for update of status;
  v_count pls_integer := 0;
begin
  for f in c_late loop
    update flights set status = 'CANCELLED' where current of c_late;
    v_count := v_count + 1;
    exit when v_count = 3;
  end loop;
  dbms_output.put_line(v_count || ' flights cancelled');
  rollback;
end;
/
-- @cleanup drop function if exists flights_on
