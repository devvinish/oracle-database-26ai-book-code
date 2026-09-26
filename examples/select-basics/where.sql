select flight_no, scheduled_departure, status
from   flights
where  route_id = 1
and    status = 'CANCELLED';
