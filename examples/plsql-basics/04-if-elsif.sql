declare
  v_points number;
  v_tier   varchar2(10);
begin
  select json_value(loyalty, '$.points' returning number) into v_points
  from   customers where customer_id = 5;

  if v_points >= 100000 then
    v_tier := 'Platinum';
  elsif v_points >= 40000 then
    v_tier := 'Gold';
  elsif v_points >= 10000 then
    v_tier := 'Silver';
  else
    v_tier := 'Blue';
  end if;
  dbms_output.put_line(v_points || ' points: ' || v_tier);
end;
/
