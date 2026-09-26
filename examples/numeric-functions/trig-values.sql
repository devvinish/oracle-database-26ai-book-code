select round(sin(acos(-1) / 2), 4)  as sin_90,
       round(cos(acos(-1)), 4)      as cos_180,
       round(tan(acos(-1) / 4), 4)  as tan_45,
       round(asin(1), 4)            as asin_1,
       round(atan(1), 4)            as atan_1,
       round(atan2(1, -1), 4)       as atan2,
       round(sinh(1), 4)            as sinh_1,
       round(cosh(1), 4)            as cosh_1,
       round(tanh(1), 4)            as tanh_1
from   dual;
