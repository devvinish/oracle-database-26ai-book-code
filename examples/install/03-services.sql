-- @connect sysdba
alter session set container = cdb$root;
select name, con_name from v$active_services
where  name not like 'SYS$%'
order  by 1;
