select power(2, 10) as power, power(1.05, 3) as compound,
       round(sqrt(2), 6) as sqrt_2, round(exp(1), 6) as e, ln(exp(2)) as ln_e2
from   dual;

select power(9, 0.5) as root, log(2, 1024) as log2, log(10, 1000) as log10 from dual;
