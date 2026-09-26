-- @expect-error
select department_id, last_name, count(*) from employees group by department_id;
