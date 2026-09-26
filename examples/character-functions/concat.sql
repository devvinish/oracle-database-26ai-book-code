select concat(first_name, last_name)                 as concat2,
       concat(first_name, ' ', last_name)            as concat3,
       first_name || ' ' || last_name                as piped,
       'Ms. ' || null || last_name                   as with_null
from   employees
where  employee_id = 100;
