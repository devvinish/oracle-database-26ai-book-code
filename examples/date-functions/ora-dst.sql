-- @expect-error
select ora_dst_affected(timestamp '2026-03-15 10:00:00 Europe/London') as affected
from   dual;
