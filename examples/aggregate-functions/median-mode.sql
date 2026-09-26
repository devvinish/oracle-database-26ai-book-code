select department_id, count(*) as staff, median(salary) as median_salary,
       round(avg(salary)) as avg_salary, stats_mode(base_airport) as usual_base
from   employees
where  department_id in (20, 30, 40)
group  by department_id;
