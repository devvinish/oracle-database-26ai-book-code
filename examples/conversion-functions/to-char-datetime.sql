select flight_no,
       to_char(scheduled_departure, 'Dy DD Mon YYYY HH24:MI TZR') as departure,
       to_char(scheduled_departure, 'fmDay, Month ddth, YYYY')     as long_date,
       to_char(scheduled_departure, 'HH:MI AM')                   as time_12h
from   flights
where  flight_id = 3;

select to_char(date '2026-03-15', 'DD Month YYYY', 'NLS_DATE_LANGUAGE = French') as french,
       to_char(date '2026-03-15', 'IYYY-"W"IW-D') as iso_week,
       to_char(date '2026-03-15', 'Q') as quarter,
       to_char(date '2026-03-15', 'DDD') as day_of_year
from   dual;
