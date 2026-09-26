select count(distinct customer_id)        as exact_customers,
       approx_count_distinct(customer_id)   as approx_customers,
       approx_count_distinct(booking_ref)   as approx_refs
from   bookings;

-- the three routes with the most flights, found approximately
select route_id, approx_count(*) as flights
from   flights
group  by route_id
having approx_rank(order by approx_count(*) desc) <= 3;

-- the cabin that earned the most
select cabin, approx_sum(fare) as revenue
from   tickets
group  by cabin
having approx_rank(order by approx_sum(fare) desc) <= 1;
