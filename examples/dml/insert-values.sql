insert into customers (first_name, last_name, email, phone, country_code)
values ('Maya', 'Pillai', 'maya.pillai@example.com', '+91 98 111 2222', 'IN');

select customer_id, first_name, last_name, joined_on, loyalty
from   customers
where  email = 'maya.pillai@example.com';

rollback;
