-- @setup drop index if exists flights_status_bx
create bitmap index flights_status_bx on flights (status);

explain plan for select count(*) from flights where status = 'CANCELLED';
select * from table(dbms_xplan.display(format => 'BASIC'));
-- @cleanup drop index if exists flights_status_bx
