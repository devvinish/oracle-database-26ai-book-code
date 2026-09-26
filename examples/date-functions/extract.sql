select flight_no, scheduled_departure,
       extract(year from scheduled_departure)             as year,
       extract(month from scheduled_departure)            as month,
       extract(hour from scheduled_departure)             as hour,
       extract(timezone_region from scheduled_departure)  as region
from   flights
where  flight_id = 2;

select extract(day from interval '3 04:30:00' day to second) as days,
       extract(minute from interval '3 04:30:00' day to second) as minutes
from   dual;
