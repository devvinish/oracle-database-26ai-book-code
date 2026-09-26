-- @expect-error
select last_name from employees where row_number() over (order by salary desc) <= 3;
