select block_minutes,
       numtodsinterval(block_minutes, 'MINUTE') as block_time,
       numtoyminterval(18, 'MONTH')             as eighteen_months
from   routes
where  route_id = 1;

select to_dsinterval('0 02:30:00') as ds_literal, to_dsinterval('PT2H30M') as ds_iso,
       to_yminterval('01-06')      as ym_literal, to_yminterval('P1Y6M')   as ym_iso
from   dual;
