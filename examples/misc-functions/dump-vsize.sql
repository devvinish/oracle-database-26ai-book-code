select dump('Zoë') as text_utf8, dump('Zoë', 16) as hex, dump(123.45) as number_bytes
from   dual;

select dump(date '2026-03-15') as date_bytes, vsize(123.45) as num_size,
       vsize(sysdate) as date_size, vsize('Zoë') as text_size
from   dual;
