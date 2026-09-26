select sys_context('USERENV', 'CURRENT_USER')    as current_user,
       sys_context('USERENV', 'SESSION_USER')    as session_user,
       sys_context('USERENV', 'CON_NAME')        as container,
       sys_context('USERENV', 'DB_NAME')         as db_name,
       sys_context('USERENV', 'SERVICE_NAME')    as service,
       sys_context('USERENV', 'LANGUAGE')        as language
from   dual;

select sys_context('USERENV', 'SID') as sid, sys_context('USERENV', 'MODULE') as module,
       sys_context('USERENV', 'IP_ADDRESS') as ip, sys_context('USERENV', 'ISDBA') as is_dba
from   dual;
