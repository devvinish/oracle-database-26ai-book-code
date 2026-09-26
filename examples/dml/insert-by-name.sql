-- @setup drop table if exists staff_list purge
create table staff_list (employee_id number, full_name varchar2(70),
                         job_title varchar2(40));

-- BY NAME matches the query's column aliases to the table's columns, in any order
insert into staff_list by name
select job_title, first_name || ' ' || last_name as full_name, employee_id
from   employees
where  department_id = 10;

select * from staff_list;
-- @cleanup drop table if exists staff_list purge
