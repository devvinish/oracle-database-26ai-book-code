select x,
       nanvl(x, 0) as nan_as_zero,
       case when x is nan then 'NaN'
            when x is infinite then 'Infinite'
            else 'number'
       end as kind
from   (values (binary_double_nan), (binary_double_infinity), (to_binary_double(2.5)))
         t (x);
