declare
  c      integer := dbms_sql.open_cursor;
  v_rows integer;
  v_old  number;
begin
  dbms_sql.parse(c, 'update routes set block_minutes = block_minutes + :extra
                     where origin = :o
                     returning max(block_minutes) into :m', dbms_sql.native);
  dbms_sql.bind_variable(c, 'extra', 10);
  dbms_sql.bind_variable(c, 'o', 'SYD');
  dbms_sql.bind_variable(c, 'm', v_old);
  v_rows := dbms_sql.execute(c);
  dbms_sql.variable_value(c, 'm', v_old);
  dbms_output.put_line(v_rows || ' routes updated; longest now ' || v_old || ' minutes');
  dbms_output.put_line('statement type: ' || dbms_sql.last_sql_function_code);
  dbms_sql.close_cursor(c);
  rollback;
end;
/
