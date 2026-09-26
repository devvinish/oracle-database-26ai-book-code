-- @connect sysdba
grant select any table on schema nimbus to nimbus_reader;

select privilege, schema, grantee from dba_schema_privs where grantee = 'NIMBUS_READER';
