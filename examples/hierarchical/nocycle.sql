-- every trip from Auckland that does not pass through Dubai; routes form cycles
-- (AKL>SYD>AKL), so NOCYCLE is needed, and CONNECT_BY_ISCYCLE marks where a cycle closes
select level, 'AKL' || sys_connect_by_path(destination, '>') as path,
       connect_by_iscycle as cycle
from   routes
start  with origin = 'AKL' and destination <> 'DXB'
connect by nocycle prior destination = origin and destination <> 'DXB';
