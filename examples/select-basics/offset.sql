-- page 3 of the customer list, 5 customers per page
select customer_id, first_name, last_name
from   customers
order  by customer_id
offset 10 rows fetch next 5 rows only;
