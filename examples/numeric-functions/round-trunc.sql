select 1234.5678                as n,
       round(1234.5678)         as round_0,
       round(1234.5678, 2)      as round_2,
       round(1234.5678, -2)     as round_minus_2,
       trunc(1234.5678, 2)      as trunc_2,
       trunc(1234.5678, -2)     as trunc_minus_2,
       round(-2.5)              as round_neg
from   dual;
