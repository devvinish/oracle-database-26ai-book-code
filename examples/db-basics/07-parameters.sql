-- @connect sysdba
select name, value, isses_modifiable as in_session, issys_modifiable as in_system,
       ispdb_modifiable as in_pdb
from   v$parameter
where  name in ('open_cursors', 'processes', 'undo_retention', 'optimizer_mode',
                'nls_date_format', 'compatible')
order  by name;
