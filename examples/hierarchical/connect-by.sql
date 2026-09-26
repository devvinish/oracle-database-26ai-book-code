select level, lpad(' ', 2 * (level - 1)) || first_name || ' ' || last_name as employee,
       job_title
from   employees
start  with manager_id is null
connect by prior employee_id = manager_id
and    level <= 3
order  siblings by last_name;
