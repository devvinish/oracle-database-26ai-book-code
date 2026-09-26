-- @expect-error
declare
  procedure check_fare (p_fare number) is
  begin
    if p_fare < 0 then
      raise value_error;
    end if;
  end;
begin
  begin
    check_fare(-5);
    dbms_output.put_line('not reached');
  exception
    when no_data_found then dbms_output.put_line('inner handler');
  end;
exception
  when value_error then
    dbms_output.put_line('outer block caught: ' || sqlerrm);
end;
/
