declare
  e_overbooked exception;
  v_seats_left number := 0;
begin
  if v_seats_left <= 0 then
    raise e_overbooked;
  end if;
exception
  when e_overbooked then
    dbms_output.put_line('Flight is full (' || sqlcode || ': ' || sqlerrm || ')');
end;
/
