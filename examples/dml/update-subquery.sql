-- set each booking's total to the sum of its tickets' fares
update bookings b
set    b.total_amount = (select sum(t.fare) from tickets t
                         where  t.booking_id = b.booking_id)
where  b.booking_id in (1, 2);

-- update several columns from one subquery
update employees e
set    (e.salary, e.base_airport) = (select max(salary), 'SIN' from employees
                                     where department_id = 100)
where  e.employee_id = 202;

select employee_id, salary, base_airport from employees where employee_id = 202;
rollback;
