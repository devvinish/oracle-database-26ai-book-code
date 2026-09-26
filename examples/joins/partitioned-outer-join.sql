-- one row for every cabin and every month, even months without tickets in that cabin
select t.cabin, m.month, count(t.ticket_id) as tickets
from   (select k.ticket_id, k.cabin, to_char(b.booked_at, 'YYYY-MM') as month
        from tickets k join bookings b on b.booking_id = k.booking_id) t
       partition by (t.cabin)
right  join (values ('2025-10'), ('2025-11'), ('2025-12')) m (month) on m.month = t.month
group  by t.cabin, m.month
order  by t.cabin, m.month;
