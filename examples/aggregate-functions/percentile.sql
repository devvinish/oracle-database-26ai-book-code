select percentile_cont(0.5) within group (order by total_amount) as median_cont,
       percentile_disc(0.5) within group (order by total_amount) as median_disc,
       percentile_cont(0.9) within group (order by total_amount) as p90,
       percentile_disc(0.9) within group (order by total_amount desc) as p10_desc
from   bookings
where  status <> 'CANCELLED';
