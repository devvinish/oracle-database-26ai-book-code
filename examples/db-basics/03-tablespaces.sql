-- @connect sysdba
select t.tablespace_name, t.contents, t.bigfile, round(sum(f.bytes) / 1024 / 1024) as mb
from   dba_tablespaces t
left   join dba_data_files f on f.tablespace_name = t.tablespace_name
group  by t.tablespace_name, t.contents, t.bigfile
order  by 1;

select file_name, autoextensible from dba_data_files order by 1;
