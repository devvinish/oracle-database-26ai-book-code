alter procedure show_build compile plsql_code_type = native;

select name, type, plsql_code_type, plsql_optimize_level
from   user_plsql_object_settings
where  name = 'SHOW_BUILD';
-- @cleanup drop procedure if exists show_build
