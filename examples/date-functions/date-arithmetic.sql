select date '2026-03-15' + 1                                     as tomorrow,
       to_char(date '2026-03-15' + 1/24, 'DD-MON HH24:MI')        as plus_one_hour,
       to_char(date '2026-03-15' + interval '90' minute, 'HH24:MI') as plus_interval,
       date '2026-03-15' - date '2026-01-01'                     as days_between
from   dual;

select timestamp '2026-03-15 10:00:00' - timestamp '2026-03-14 07:30:00' as difference
from   dual;
