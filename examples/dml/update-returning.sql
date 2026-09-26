declare
  v_old_fare tickets.fare%type;
  v_new_fare tickets.fare%type;
begin
  update tickets
  set    fare = fare + 25
  where  ticket_id = 1
  returning old fare, new fare into v_old_fare, v_new_fare;
  dbms_output.put_line('Fare changed from ' || v_old_fare || ' to ' || v_new_fare);
  rollback;
end;
/
