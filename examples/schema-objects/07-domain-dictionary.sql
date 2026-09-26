select name, type, cols, builtin from user_domains order by name;

select table_name, column_name, domain_name
from   user_tab_columns
where  domain_name is not null
order  by table_name, column_name;
-- @cleanup drop table if exists crew_contacts purge
-- @cleanup drop domain if exists phone_d force
