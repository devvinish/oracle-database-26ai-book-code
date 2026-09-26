-- @setup drop table if exists customers_by_region purge
-- @setup drop table if exists tickets_hashed purge
create table customers_by_region (customer_id number, country_code char(2))
partition by list (country_code) (
  partition p_asia   values ('IN', 'SG', 'HK', 'JP', 'NP'),
  partition p_europe values ('GB', 'FR', 'DE', 'NL', 'TR', 'IE'),
  partition p_other  values (default)
);
insert into customers_by_region select customer_id, country_code from customers;

create table tickets_hashed (ticket_id number, fare number)
partition by hash (ticket_id) partitions 4;
insert into tickets_hashed select ticket_id, fare from tickets;

exec dbms_stats.gather_table_stats(user, 'CUSTOMERS_BY_REGION')
exec dbms_stats.gather_table_stats(user, 'TICKETS_HASHED')

select table_name, partition_name, num_rows
from   user_tab_partitions
where  table_name in ('CUSTOMERS_BY_REGION', 'TICKETS_HASHED')
order  by table_name, partition_position;
-- @cleanup drop table if exists customers_by_region purge
-- @cleanup drop table if exists tickets_hashed purge
