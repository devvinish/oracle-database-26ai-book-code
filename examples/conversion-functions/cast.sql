select cast('15-MAR-2026' as date)                    as to_date,
       cast(12345.678 as number(7,1))                 as rounded,
       cast(scheduled_departure as date)              as dep_date,
       cast(scheduled_departure as timestamp)         as dep_local,
       cast('Dubai International' as varchar2(10))    as cut
from   flights
where  flight_id = 1;
