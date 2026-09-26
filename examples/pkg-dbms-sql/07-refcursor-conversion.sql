declare
  c    integer := dbms_sql.open_cursor;
  rc   sys_refcursor;
  v_n  integer;
  v_city varchar2(40);
begin
  dbms_sql.parse(c, 'select city from airports where is_hub', dbms_sql.native);
  v_n := dbms_sql.execute(c);
  rc := dbms_sql.to_refcursor(c);       -- hand the open cursor over as a ref cursor
  fetch rc into v_city;
  dbms_output.put_line('hub: ' || v_city);
  close rc;

  open rc for select count(*) from routes;
  c := dbms_sql.to_cursor_number(rc);      -- and back, to describe or fetch with DBMS_SQL
  dbms_output.put_line('open? ' || case when dbms_sql.is_open(c) then 'yes' else 'no' end);
  dbms_sql.close_cursor(c);
end;
/
