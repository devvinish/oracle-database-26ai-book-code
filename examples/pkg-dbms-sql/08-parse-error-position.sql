-- @expect-error
declare
  c integer := dbms_sql.open_cursor;
begin
  dbms_sql.parse(c, 'select airport_code, citty from airports', dbms_sql.native);
exception
  when others then
    dbms_output.put_line(sqlerrm);
    dbms_output.put_line('error at character ' || dbms_sql.last_error_position);
    dbms_sql.close_cursor(c);
end;
/
