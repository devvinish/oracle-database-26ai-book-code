select to_timestamp('2026-03-15 08:30:15.250', 'YYYY-MM-DD HH24:MI:SS.FF3') as ts,
       to_timestamp_tz('2026-03-15 08:30 Asia/Dubai', 'YYYY-MM-DD HH24:MI TZR')
         as ts_region,
       to_timestamp_tz('2026-03-15 08:30 +04:00', 'YYYY-MM-DD HH24:MI TZH:TZM')
         as ts_offset
from   dual;
