select json_serialize(loyalty returning varchar2(400) pretty ordered) as pretty_loyalty
from   customers
where  customer_id = 2;
