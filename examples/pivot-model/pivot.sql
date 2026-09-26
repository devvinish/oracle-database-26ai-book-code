select *
from   (select b.status, t.cabin, t.fare
        from   bookings b join tickets t on t.booking_id = b.booking_id)
pivot  (count(*) as tickets, sum(fare) as fares
        for cabin in ('BUSINESS' as business, 'ECONOMY' as economy));
