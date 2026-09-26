declare
  c1 sys_refcursor;
  c2 sys_refcursor;
begin
  open c1 for select count(*) as flights from flights;
  dbms_sql.return_result(c1);
  open c2 for select status, count(*) as n from flights group by status order by status;
  dbms_sql.return_result(c2);
end;
/
