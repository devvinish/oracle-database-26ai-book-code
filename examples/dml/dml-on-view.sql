update (select e.salary, d.department_name
        from   employees e join departments d on d.department_id = e.department_id
        where  d.department_name = 'Finance')
set    salary = salary + 500;

select last_name, salary from employees where department_id = 50;
rollback;
