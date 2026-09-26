-- @expect-error
declare
  v_ratio number;
begin
  v_ratio := 1 / 0;
exception
  when zero_divide then
    dbms_output.put_line('Division by zero: ' || sqlcode || ' ' || sqlerrm);
end;
/
