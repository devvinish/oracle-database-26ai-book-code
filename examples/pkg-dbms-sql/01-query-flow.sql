declare
  c        integer := dbms_sql.open_cursor;
  v_code   varchar2(3);
  v_city   varchar2(40);
  v_rows   integer;
begin
  dbms_sql.parse(c, 'select airport_code, city from airports where country_code = :cc
                     order by 1', dbms_sql.native);
  dbms_sql.bind_variable(c, ':cc', 'IN');
  dbms_sql.define_column(c, 1, v_code, 3);
  dbms_sql.define_column(c, 2, v_city, 40);
  v_rows := dbms_sql.execute(c);
  while dbms_sql.fetch_rows(c) > 0 loop
    dbms_sql.column_value(c, 1, v_code);
    dbms_sql.column_value(c, 2, v_city);
    dbms_output.put_line(v_code || ' ' || v_city);
  end loop;
  dbms_output.put_line('rows fetched: ' || dbms_sql.last_row_count);
  dbms_sql.close_cursor(c);
end;
/
