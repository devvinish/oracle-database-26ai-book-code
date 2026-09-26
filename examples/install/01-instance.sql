-- @connect sysdba
select instance_name, version_full, status, database_status from v$instance;

select name, cdb, open_mode, log_mode from v$database;
