select b.status, t.cabin, count(*) as tickets
from   bookings b join tickets t on t.booking_id = b.booking_id
group  by cube (b.status, t.cabin)
order  by b.status nulls last, t.cabin nulls last;
