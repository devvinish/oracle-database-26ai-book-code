select flight_no, status,
       coalesce(actual_arrival, actual_departure, scheduled_arrival) as best_known_time
from   flights
where  flight_id in (100, 2700)
or     (status = 'CANCELLED' and flight_id < 200);
