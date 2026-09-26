-- raise every fare of the business-class tickets of one booking: UPDATE with a join
update tickets t
set    t.fare = t.fare * 1.10
from   bookings b
where  b.booking_id = t.booking_id
and    b.booking_ref = 'FH2FHM';

select t.ticket_id, t.fare from tickets t join bookings b using (booking_id)
where  b.booking_ref = 'FH2FHM';
rollback;
