select flight_no,
       status,
       case status when 'ARRIVED' then 'Flown' else initcap(status) end as label,
       extract(day from (actual_arrival - actual_departure)) * 24 * 60
         + extract(hour from (actual_arrival - actual_departure)) * 60
         + extract(minute from (actual_arrival - actual_departure)) as minutes_in_air
from   flights
where  flight_id between 200 and 204;
