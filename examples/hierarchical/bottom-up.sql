-- walk up from a flight attendant to the chief executive
select level, last_name, job_title
from   employees
start  with employee_id = 140
connect by employee_id = prior manager_id;
