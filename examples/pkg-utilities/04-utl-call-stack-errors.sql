-- @expect-error
begin
  level_one;
exception
  when others then
    for i in 1 .. utl_call_stack.error_depth loop
      dbms_output.put_line('error ' || i || ': ORA-'
                           || to_char(utl_call_stack.error_number(i), 'fm00000')
                           || ': ' || utl_call_stack.error_msg(i));
    end loop;
    for i in 1 .. utl_call_stack.backtrace_depth loop
      dbms_output.put_line('at ' || nvl(utl_call_stack.backtrace_unit(i), 'anonymous block')
                           || ' line ' || utl_call_stack.backtrace_line(i));
    end loop;
end;
/
-- @cleanup drop procedure if exists level_one
-- @cleanup drop procedure if exists level_two
