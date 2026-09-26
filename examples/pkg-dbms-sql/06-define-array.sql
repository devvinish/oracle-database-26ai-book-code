declare
  c       integer := dbms_sql.open_cursor;
  v_codes dbms_sql.varchar2_table;
  v_n     integer;
begin
  dbms_sql.parse(c, 'select airport_code from airports order by 1', dbms_sql.native);
  dbms_sql.define_array(c, 1, v_codes, 10, 1);            -- fetch 10 rows at a time
  v_n := dbms_sql.execute(c);
  loop
    v_n := dbms_sql.fetch_rows(c);
    dbms_sql.column_value(c, 1, v_codes);
    exit when v_n < 10;
  end loop;
  dbms_output.put_line(v_codes.count || ' codes, from ' || v_codes(v_codes.first)
                       || ' to ' || v_codes(v_codes.last));
  dbms_sql.close_cursor(c);
end;
/
