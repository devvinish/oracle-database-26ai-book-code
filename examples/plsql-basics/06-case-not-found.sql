-- @expect-error
begin
  case 'DIVERTED'
    when 'ARRIVED' then dbms_output.put_line('landed');
  end case;
end;
/
