select round(skewness_pop(total_amount), 3)  as skew_pop,
       round(skewness_samp(total_amount), 3) as skew_samp,
       round(kurtosis_pop(total_amount), 3)  as kurt_pop,
       round(kurtosis_samp(total_amount), 3) as kurt_samp
from   bookings;
