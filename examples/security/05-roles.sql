-- @connect sysdba
-- @setup drop role if exists nimbus_reader
create role nimbus_reader;
grant nimbus_reader to nimbus_app;

select granted_role, admin_option, default_role
from   dba_role_privs
where  grantee = 'NIMBUS_APP';
