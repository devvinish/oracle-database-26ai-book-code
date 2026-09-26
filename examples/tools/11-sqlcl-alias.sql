alias cancelled=select flight_no from flights where status = 'CANCELLED' and route_id = :r;
cancelled 1
