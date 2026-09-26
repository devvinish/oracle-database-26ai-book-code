select flight_no, to_char(scheduled_departure, 'DD-MON') as day, status,
       lag(status) over (order by scheduled_departure)            as previous_status,
       lead(status, 1, 'none') over (order by scheduled_departure) as next_status,
       scheduled_departure - lag(scheduled_departure) over (order by scheduled_departure)
         as gap
from   flights
where  route_id = 5 and scheduled_departure < timestamp '2026-01-10 00:00:00 UTC';
