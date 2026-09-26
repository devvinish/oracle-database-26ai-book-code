select last_name, sys_connect_by_path(last_name, ' / ') as path
from   employees
where  employee_id in (116, 133, 196)
start  with manager_id is null
connect by prior employee_id = manager_id;
