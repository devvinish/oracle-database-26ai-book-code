-- @setup drop view if exists loyalty_v
-- @setup drop index if exists customers_loyalty_sx
create search index customers_loyalty_sx on customers (loyalty) for json
  parameters ('dataguide on');

begin
  dbms_json.create_view_on_path(viewname  => 'LOYALTY_V',
                                tablename => 'CUSTOMERS',
                                jcolname  => 'LOYALTY',
                                path      => '$');
end;
/
select column_name, data_type from user_tab_columns
where  table_name = 'LOYALTY_V' and column_name like 'LOYALTY$%' order by column_id;

select customer_id, "LOYALTY$tier" as tier, "LOYALTY$points" as points,
       "LOYALTY$string" as favourite
from   loyalty_v
where  customer_id <= 2;
-- @cleanup drop view if exists loyalty_v
-- @cleanup drop index if exists customers_loyalty_sx
