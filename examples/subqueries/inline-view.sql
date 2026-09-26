select dept.department_name, s.staff, s.payroll
from   (select department_id, count(*) as staff, sum(salary) as payroll
        from employees group by department_id) s
join   departments dept on dept.department_id = s.department_id
where  s.staff >= 10;
