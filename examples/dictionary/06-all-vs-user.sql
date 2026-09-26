select owner, count(*) as tables_i_can_see
from   all_tables
where  owner in ('NIMBUS', 'SYS', 'XDB')
group  by owner
order  by owner;
