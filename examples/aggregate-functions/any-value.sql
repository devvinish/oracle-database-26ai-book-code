select d.department_id, any_value(d.department_name) as department, count(*) as staff
from   departments d join employees e on e.department_id = d.department_id
group  by d.department_id
order  by staff desc
fetch  first 3 rows only;
