delete from payments where amount < 0 and booking_id <= 100;

delete payments p
from   bookings b
where  b.booking_id = p.booking_id and b.status = 'CANCELLED';

select count(*) as refunds_left from payments where amount < 0;
rollback;
