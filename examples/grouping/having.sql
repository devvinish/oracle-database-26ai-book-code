select customer_id, count(*) as bookings, sum(total_amount) as spent
from   bookings
where  status <> 'CANCELLED'
group  by customer_id
having sum(total_amount) > 20000
order  by spent desc;
