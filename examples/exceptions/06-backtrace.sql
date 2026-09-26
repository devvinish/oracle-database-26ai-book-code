-- @expect-error
create or replace procedure load_fares is
  v_n number;
begin
  v_n := to_number('many');
end;
/
begin
  load_fares;
exception
  when others then
    dbms_output.put_line('Error:     ' || sqlerrm);
    dbms_output.put_line('Backtrace: ' || dbms_utility.format_error_backtrace);
    raise;                -- re-raise after logging
end;
/
-- @cleanup drop procedure if exists load_fares
