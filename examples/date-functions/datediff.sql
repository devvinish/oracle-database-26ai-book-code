select datediff(day, date '2026-01-01', date '2026-03-15')    as days,
       datediff(week, date '2026-01-01', date '2026-03-15')   as weeks,
       datediff(month, date '2026-01-31', date '2026-02-01')  as month_boundaries,
       datediff(year, date '2025-12-31', date '2026-01-01')   as year_boundaries,
       timestampdiff(minute, timestamp '2026-03-15 08:00:00',
                             timestamp '2026-03-15 10:45:00') as minutes
from   dual;

select flight_no, datediff(minute, scheduled_departure, actual_departure) as minutes_late
from   flights
where  flight_id between 20 and 24;
