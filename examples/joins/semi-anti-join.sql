-- semi-join: customers with at least one business ticket (each customer once)
select count(*) as business_customers
from   customers c
where  exists (select null from bookings b join tickets t on t.booking_id = b.booking_id
               where b.customer_id = c.customer_id and t.cabin = 'BUSINESS');

-- anti-join: customers who never wrote a review
select count(*) as silent_customers
from   customers c
where  not exists (select null from reviews r where r.customer_id = c.customer_id);
