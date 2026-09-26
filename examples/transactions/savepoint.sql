update employees set salary = salary + 100 where employee_id = 161;
savepoint after_raise;
delete from crew_assignments where employee_id = 140;
rollback to savepoint after_raise;

select (select salary from employees where employee_id = 161) as salary_161,
       (select count(*) from crew_assignments where employee_id = 140) as crew_rows;
rollback;
