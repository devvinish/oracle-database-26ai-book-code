-- the foreign keys of FLIGHTS, and the tables they point to
select c.constraint_name, cc.column_name, p.table_name as references_table,
       pc.column_name as references_column
from   user_constraints c
join   user_cons_columns cc on cc.constraint_name = c.constraint_name
join   user_constraints p   on p.constraint_name  = c.r_constraint_name
join   user_cons_columns pc on pc.constraint_name = p.constraint_name
where  c.table_name = 'FLIGHTS' and c.constraint_type = 'R'
order  by c.constraint_name;
