-- @setup drop index if exists bookings_booked_at_ix
explain plan for select * from bookings where booked_at > timestamp '2026-03-10 00:00:00';
select * from table(dbms_xplan.display(format => 'BASIC'));

create index bookings_booked_at_ix on bookings (booked_at);

explain plan for select * from bookings where booked_at > timestamp '2026-03-10 00:00:00';
select * from table(dbms_xplan.display(format => 'BASIC'));
