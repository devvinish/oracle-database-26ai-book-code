-- @connect sysdba
select oracle_maintained, count(*) as users
from   dba_users
group  by oracle_maintained;

select username, account_status, default_tablespace
from   dba_users
where  username = 'NIMBUS';
