declare
  v_status flights.status%type;
  v_text   varchar2(40);
begin
  select status into v_status from flights where flight_id = 2800;

  case v_status                                   -- a simple CASE statement
    when 'ARRIVED'   then v_text := 'has landed';
    when 'CANCELLED' then v_text := 'was cancelled';
    else                  v_text := 'is on schedule';
  end case;
  dbms_output.put_line('Flight 2800 ' || v_text);

  -- a CASE expression
  v_text := case when v_status = 'SCHEDULED' then 'bookable' else 'closed' end;
  dbms_output.put_line('Sales: ' || v_text);
end;
/
