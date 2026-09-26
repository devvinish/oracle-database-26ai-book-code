declare
  c       integer := dbms_sql.open_cursor;
  v_tab   dbms_sql.desc_tab2;
  v_n     integer;
begin
  dbms_sql.parse(c, 'select * from flights', dbms_sql.native);
  dbms_sql.describe_columns2(c, v_n, v_tab);
  for i in 1 .. v_n loop
    dbms_output.put_line(rpad(v_tab(i).col_name, 22) || 'type '
                         || rpad(v_tab(i).col_type, 5)
                         || 'max length ' || v_tab(i).col_max_len
                         || case when v_tab(i).col_null_ok then '' else '  not null' end);
  end loop;
  dbms_sql.close_cursor(c);
end;
/
