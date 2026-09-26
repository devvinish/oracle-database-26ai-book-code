update employees
set    salary = salary * 1.05
where  department_id = 90;

select employee_id, last_name, salary from employees where department_id = 90;
rollback;
