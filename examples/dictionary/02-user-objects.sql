select object_type, count(*) as objects,
       count(case when status <> 'VALID' then 1 end) as invalid
from   user_objects
where  object_name not like 'ST0000%' and object_name not like 'SYS_%'
group  by object_type
order  by object_type;
