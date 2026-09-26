select sys_context('USERENV', 'SESSION_USER')  as session_user,
       sys_context('USERENV', 'CON_NAME')      as container,
       sys_context('USERENV', 'SERVICE_NAME')  as service,
       sys_context('USERENV', 'DB_NAME')       as db_name
from   dual;
