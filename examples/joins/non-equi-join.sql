select e.last_name, e.salary, g.grade
from   employees e
join   (values ('A', 0, 7999), ('B', 8000, 14999), ('C', 15000, 29999), ('D', 30000, 99999))
       g (grade, low, high)
       on e.salary between g.low and g.high
where  e.department_id = 40
order  by e.salary;
