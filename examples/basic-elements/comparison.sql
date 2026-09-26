select airport_code, elevation_ft
from   airports
where  elevation_ft >= 3000
and    airport_code <> 'BLR'
and    airport_code != 'KTM';

select last_name, salary from employees
where  salary > all (select salary from employees where department_id = 40)
order  by salary;

select last_name, salary from employees
where  salary = any (20000, 20500, 21000);
