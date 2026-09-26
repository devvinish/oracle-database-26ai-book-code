-- @connect sysdba
-- @setup drop tablespace if exists nimbus_archive including contents and datafiles
create tablespace nimbus_archive
  datafile '/opt/oracle/oradata/FREE/FREEPDB1/nimbus_archive01.dbf' size 20m
  autoextend on next 10m maxsize 200m;

alter user nimbus quota 100m on nimbus_archive;

select tablespace_name, round(max_bytes / 1024 / 1024) as quota_mb
from   dba_ts_quotas where username = 'NIMBUS' order by 1;
-- @cleanup alter user nimbus quota 0 on nimbus_archive
-- @cleanup drop tablespace if exists nimbus_archive including contents and datafiles
