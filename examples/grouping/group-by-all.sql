select b.status, t.cabin, count(*) as tickets, sum(t.fare) as fares
from   bookings b join tickets t on t.booking_id = b.booking_id
group  by all
order  by b.status, t.cabin;
