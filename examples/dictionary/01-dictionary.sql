select count(*) as dictionary_views from dictionary;

select table_name, comments
from   dictionary
where  table_name like 'USER_TAB%'
order  by table_name
fetch  first 8 rows only;
