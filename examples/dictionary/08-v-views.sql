select sid, serial#, username, program, status
from   v$session
where  sid = sys_context('USERENV', 'SID');

select name, value from v$parameter
where  name in ('db_name', 'compatible', 'undo_retention', 'max_string_size')
order  by name;
