alter procedure raise_salary compile;
alter function flight_minutes compile plsql_optimize_level = 3 reuse settings;

select name, type, plsql_optimize_level, plsql_code_type
from   user_plsql_object_settings
where  name in ('RAISE_SALARY', 'FLIGHT_MINUTES');
