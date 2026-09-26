-- @connect sysdba
select name, round(bytes / 1024 / 1024) as mb
from   v$sgainfo
where  name in ('Maximum SGA Size', 'Buffer Cache Size', 'Shared Pool Size',
                'Large Pool Size', 'Java Pool Size', 'Redo Buffers')
order  by bytes desc;

select round(value / 1024 / 1024) as pga_target_mb
from   v$parameter where name = 'pga_aggregate_target';
