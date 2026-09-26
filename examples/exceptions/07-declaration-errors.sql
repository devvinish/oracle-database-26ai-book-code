-- @expect-error
begin
  declare
    v_code char(2) := 'DXB';        -- too long: raised when the block starts
  begin
    dbms_output.put_line(v_code);
  exception
    when value_error then dbms_output.put_line('inner handler never sees it');
  end;
exception
  when value_error then
    dbms_output.put_line('caught by the enclosing block: ' || sqlerrm);
end;
/
