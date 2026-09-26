declare
  type t_ids is table of flights.flight_id%type;
  type t_nos is table of flights.flight_no%type;
  v_ids t_ids;
  v_nos t_nos;
begin
  select flight_id, flight_no bulk collect into v_ids, v_nos
  from   flights where route_id = 13 and status = 'CANCELLED';
  dbms_output.put_line(v_ids.count || ' cancelled flights on route 13');
  for i in 1 .. v_ids.count loop
    dbms_output.put_line(v_ids(i) || ' ' || v_nos(i));
  end loop;
end;
/
