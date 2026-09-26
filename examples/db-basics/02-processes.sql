-- @connect sysdba
select name, description
from   v$bgprocess
where  paddr <> '00'                                -- the processes that are running
and    name in ('PMON', 'SMON', 'DBW0', 'LGWR', 'CKPT', 'ARC0', 'MMON', 'RECO', 'CJQ0')
order  by name;
