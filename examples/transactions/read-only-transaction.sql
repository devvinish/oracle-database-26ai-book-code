-- @expect-error
set transaction read only name 'month-end report';
select count(*) as bookings from bookings;
update bookings set status = status where booking_id = 1;
commit;
