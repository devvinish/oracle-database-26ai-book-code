select customer_id, first_name, last_name
from   customers
where  regexp_like(last_name, '^(van|o'')', 'i')
   or  regexp_like(last_name, '\s')
order  by customer_id;
