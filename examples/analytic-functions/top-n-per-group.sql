select department_id, last_name, salary
from   (select department_id, last_name, salary,
               row_number() over (partition by department_id order by salary desc) as rn
        from   employees)
where  rn <= 2 and department_id in (20, 30, 40)
order  by department_id, salary desc;
