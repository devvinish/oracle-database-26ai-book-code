select customer_id, count(*) as bookings,
       row_number() over (order by count(*) desc) as row_number,
       rank()       over (order by count(*) desc) as rank,
       dense_rank() over (order by count(*) desc) as dense_rank
from   bookings
group  by customer_id
order  by bookings desc, customer_id
fetch  first 9 rows only;
