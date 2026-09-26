select b.booking_ref, count(*) as tickets,
       boolean_and_agg(t.checked_in) as all_checked_in,
       boolean_or_agg(t.checked_in)  as any_checked_in,
       every(t.cabin = 'BUSINESS')   as all_business
from   bookings b join tickets t on t.booking_id = b.booking_id
where  b.booking_id in (1, 2, 699, 700)
group  by b.booking_ref;
