select from_tz(timestamp '2026-03-15 08:30:00', 'Asia/Dubai')         as dubai,
       from_tz(timestamp '2026-03-15 08:30:00', '+05:45')             as offset,
       sys_extract_utc(from_tz(timestamp '2026-03-15 08:30:00', 'Asia/Dubai')) as utc
from   dual;
