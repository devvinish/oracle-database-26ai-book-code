select last_name, level, connect_by_root last_name as top_manager,
       connect_by_isleaf as is_leaf
from   employees
start  with employee_id in (130, 180)
connect by prior employee_id = manager_id
order  siblings by last_name;
