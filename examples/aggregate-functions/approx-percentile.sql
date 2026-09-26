select approx_median(total_amount)                                  as approx_median,
       median(total_amount)                                         as exact_median,
       approx_percentile(0.9) within group (order by total_amount)   as approx_p90,
       approx_percentile(0.9 deterministic) within group (order by total_amount) as det_p90
from   bookings;
