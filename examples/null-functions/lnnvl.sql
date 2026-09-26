select employee_id, first_name, commission_pct
from   employees
where  lnnvl(commission_pct >= 0.1)
and    department_id = 40;
