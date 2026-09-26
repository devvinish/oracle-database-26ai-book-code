-- @expect-error
declare
  v_status flights.status%type;
begin
  select status into v_status from flights where flight_id = 30;
  if v_status <> 'SCHEDULED' then
    raise_application_error(-20001, 'Flight 30 can''t be rebooked: it is ' || v_status);
  end if;
end;
/
