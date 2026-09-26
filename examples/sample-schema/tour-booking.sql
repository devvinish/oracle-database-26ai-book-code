select b.booking_ref, c.first_name || ' ' || c.last_name as customer, b.status,
       b.total_amount, json_value(c.loyalty, '$.tier') as tier
from   bookings b join customers c on c.customer_id = b.customer_id
where  b.booking_id = 100;

select t.ticket_id, f.flight_no, t.cabin, t.seat_no, t.fare, t.checked_in
from   tickets t join flights f on f.flight_id = t.flight_id
where  t.booking_id = 100;
