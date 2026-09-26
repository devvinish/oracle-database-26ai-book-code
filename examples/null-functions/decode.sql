select flight_no, status,
       decode(status, 'ARRIVED', 'Flown', 'CANCELLED', 'Cancelled', 'Planned') as label,
       decode(actual_departure, null, 'no departure yet', 'departed')     as nulls_match
from   flights
where  flight_id in (1, 30, 2800);
