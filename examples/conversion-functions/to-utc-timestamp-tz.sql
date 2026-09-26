select to_utc_timestamp_tz('2026-03-15T08:30:00+04:00') as from_offset,
       to_utc_timestamp_tz('2026-03-15T08:30:00Z')      as from_utc,
       to_utc_timestamp_tz('2026-03-15')                as date_only
from   dual;
