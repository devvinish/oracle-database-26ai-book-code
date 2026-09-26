select last_name, department_id, commission_pct
from   employees
where  department_id = 40
order  by commission_pct desc nulls last, last_name;
