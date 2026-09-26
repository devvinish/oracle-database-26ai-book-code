create or replace function top_n (p_table dbms_tf.table_t, p_column dbms_tf.columns_t,
                                  p_n number)
  return varchar2 sql_macro(table)
is
begin
  return 'select * from p_table order by ' || p_column(1)
         || ' desc fetch first p_n rows only';
end;
/
select airport_code, elevation_ft from top_n(airports, columns(elevation_ft), 3);

select last_name, salary from top_n(employees, columns(salary), 2);
-- @cleanup drop function if exists top_n
-- @cleanup drop function if exists minutes_between
