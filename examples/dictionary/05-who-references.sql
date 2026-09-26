-- which tables reference FLIGHTS?
select c.table_name, c.constraint_name, c.delete_rule
from   user_constraints c
where  c.r_constraint_name in (select constraint_name from user_constraints
                               where  table_name = 'FLIGHTS' and constraint_type = 'P')
order  by c.table_name;
