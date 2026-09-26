-- @client sqlplus
set pagesize 40 linesize 80 feedback off
column department_id heading 'Dept' format 999
column last_name format a12
column salary format 99,990
break on department_id skip 1
compute sum label 'Sum' of salary on department_id
select department_id, last_name, salary
from   employees
where  department_id in (50, 60)
order  by department_id, salary desc;
