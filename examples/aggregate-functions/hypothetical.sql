-- where would a salary of 12,000 rank among the employees?
select rank(12000)         within group (order by salary desc) as rank,
       dense_rank(12000)   within group (order by salary desc) as dense_rank,
       round(percent_rank(12000) within group (order by salary desc), 3) as percent_rank,
       round(cume_dist(12000)    within group (order by salary desc), 3) as cume_dist
from   employees;
