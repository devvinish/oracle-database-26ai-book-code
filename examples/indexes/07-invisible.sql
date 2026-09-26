alter index bookings_booked_at_ix invisible;

explain plan for select * from bookings where booked_at > timestamp '2026-03-10 00:00:00';
select * from table(dbms_xplan.display(format => 'BASIC'));

alter session set optimizer_use_invisible_indexes = true;
explain plan for select * from bookings where booked_at > timestamp '2026-03-10 00:00:00';
select * from table(dbms_xplan.display(format => 'BASIC'));

alter index bookings_booked_at_ix visible;
