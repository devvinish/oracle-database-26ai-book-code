-- @setup drop index if exists customers_loyalty_sx
create search index customers_loyalty_sx on customers (loyalty) for json;

select customer_id, json_value(loyalty, '$.tier') as tier
from   customers
where  json_textcontains(loyalty, '$.preferences.meal', 'vegan')
order  by customer_id;
-- @cleanup drop index if exists customers_loyalty_sx
-- @cleanup drop view if exists customer_dv
