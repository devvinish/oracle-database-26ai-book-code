create or replace procedure print_query (p_sql varchar2) is
  c      integer := dbms_sql.open_cursor;
  v_cols dbms_sql.desc_tab3;
  v_n    integer;
  v_val  varchar2(4000);
  v_line varchar2(4000);
begin
  dbms_sql.parse(c, p_sql, dbms_sql.native);
  dbms_sql.describe_columns3(c, v_n, v_cols);   -- the query's columns, at run time
  for i in 1 .. v_n loop
    dbms_sql.define_column(c, i, v_val, 4000);
    v_line := v_line || rpad(v_cols(i).col_name, 18);
  end loop;
  dbms_output.put_line(v_line);
  v_n := dbms_sql.execute(c);
  while dbms_sql.fetch_rows(c) > 0 loop
    v_line := null;
    for i in 1 .. v_cols.count loop
      dbms_sql.column_value(c, i, v_val);
      v_line := v_line || rpad(nvl(v_val, ' '), 18);
    end loop;
    dbms_output.put_line(v_line);
  end loop;
  dbms_sql.close_cursor(c);
end;
/
begin
  print_query('select type_code, model, range_km from aircraft_types
               where manufacturer = ''Boeing''');
  print_query('select region, count(*) as countries from countries group by region');
end;
/
