select extract(month from booked_at) as month_no, count(*) as bookings
from   bookings
group  by month_no
order  by month_no;

alter session set group_by_position_enabled = true;

select status, cabin, count(*) as tickets
from   bookings join tickets using (booking_id)
group  by 1, 2
order  by 1, 2;
