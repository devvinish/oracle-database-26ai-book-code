select directory_name, directory_path
from   all_directories
where  directory_name = 'NIMBUS_FILES';

select privilege from user_tab_privs where table_name = 'NIMBUS_FILES' order by privilege;
