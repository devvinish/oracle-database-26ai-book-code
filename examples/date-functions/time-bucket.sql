select time_bucket(scheduled_departure, interval '6' hour,
                   timestamp '2026-01-01 00:00:00 UTC') as block_start,
       count(*) as departures
from   flights
where  scheduled_departure >= timestamp '2026-01-01 00:00:00 UTC'
and    scheduled_departure <  timestamp '2026-01-02 00:00:00 UTC'
group  by all
order  by 1;

select time_bucket(date '2026-03-15', 'P1M', date '2026-01-01')      as month_bucket,
       time_bucket(date '2026-03-15', 'P1M', date '2026-01-01', end) as bucket_end
from   dual;
