select username, default_tablespace, temporary_tablespace, account_status
from   user_users;

select object_type, count(*) as objects
from   user_objects
where  generated = 'N'                           -- leave out system-generated objects
group  by object_type
order  by objects desc
fetch  first 5 rows only;

select segment_name, round(bytes / 1024) as kb
from   user_segments
where  segment_type = 'TABLE' and segment_name not like 'BIN$%'   -- not dropped tables
order  by bytes desc
fetch  first 4 rows only;
