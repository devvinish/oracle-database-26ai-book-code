select round(variance(salary))     as variance,
       round(var_pop(salary))      as var_pop,
       round(var_samp(salary))     as var_samp,
       round(stddev(salary), 1)    as stddev,
       round(stddev_pop(salary), 1)  as stddev_pop,
       round(stddev_samp(salary), 1) as stddev_samp
from   employees
where  department_id = 30;
