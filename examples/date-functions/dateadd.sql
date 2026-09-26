select dateadd(day, 3, date '2026-03-15')                          as plus_3_days,
       dateadd(month, 1, date '2026-01-31')                        as plus_1_month,
       dateadd(quarter, -1, date '2026-03-15')                     as minus_quarter,
       dateadd(minute, 90, timestamp '2026-03-15 23:00:00')        as plus_90_minutes
from   dual;
