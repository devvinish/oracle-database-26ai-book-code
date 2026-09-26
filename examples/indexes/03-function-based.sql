-- @setup drop index if exists customers_last_name_upper_ix
create index customers_last_name_upper_ix on customers (upper(last_name));
exec dbms_stats.gather_table_stats(user, 'CUSTOMERS')

explain plan for select * from customers where upper(last_name) = 'KHAN';
select * from table(dbms_xplan.display(format => 'BASIC'));
