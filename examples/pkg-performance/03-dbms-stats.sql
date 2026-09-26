-- @setup drop table if exists flight_copy purge
create table flight_copy as select * from flights;          -- gathers statistics too

delete from flight_copy where status = 'CANCELLED';
commit;

select num_rows, blocks from user_tab_statistics where table_name = 'FLIGHT_COPY';

begin
  dbms_stats.gather_table_stats(user, 'FLIGHT_COPY',
                                method_opt => 'for all columns size auto');
end;
/
select num_rows, blocks from user_tab_statistics where table_name = 'FLIGHT_COPY';

select column_name, num_distinct, histogram
from   user_tab_col_statistics
where  table_name = 'FLIGHT_COPY' and column_name in ('STATUS', 'ROUTE_ID', 'FLIGHT_ID');
