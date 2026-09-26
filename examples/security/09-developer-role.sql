-- @connect sysdba
select privilege from dba_sys_privs where grantee = 'DB_DEVELOPER_ROLE' order by privilege;
