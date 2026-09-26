declare
  v_flights number;
begin
  select count(*) into v_flights from flights where status = 'CANCELLED';
  dbms_output.put_line('Cancelled flights: ' || v_flights);
exception
  when others then
    dbms_output.put_line('Something went wrong: ' || sqlerrm);
end;
/
