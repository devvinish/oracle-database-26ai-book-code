-- @connect sysdba
-- @setup drop user if exists nimbus_app cascade
-- @setup drop profile if exists app_profile cascade
create user nimbus_app identified by "Fly#Nimbus2026"
  default tablespace users
  quota 10m on users
  password expire;

alter user nimbus_app identified by "Fly#Nimbus2026" account unlock;
grant create session to nimbus_app;

select username, account_status, default_tablespace, authentication_type
from   dba_users
where  username = 'NIMBUS_APP';
