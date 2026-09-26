select b.booking_ref, c.last_name, f.flight_no, r.origin, r.destination, t.cabin, t.seat_no
from   bookings b
join   customers c on c.customer_id = b.customer_id
join   tickets t   on t.booking_id  = b.booking_id
join   flights f   on f.flight_id   = t.flight_id
join   routes r    on r.route_id    = f.route_id
where  b.booking_id in (100, 101);
