-- @expect-error
create or replace procedure level_two is
begin
  dbms_output.put_line(rtrim(dbms_utility.format_call_stack, chr(10)));
  raise_application_error(-20005, 'Fare table locked');
end;
/
create or replace procedure level_one is
begin
  level_two;
end;
/
begin
  level_one;
exception
  when others then
    dbms_output.put_line('Error stack: ' || dbms_utility.format_error_stack);
    dbms_output.put_line('Backtrace:   ' || dbms_utility.format_error_backtrace);
end;
/
