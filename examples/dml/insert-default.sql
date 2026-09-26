insert into bookings (booking_ref, customer_id, booked_at, status, total_amount,
                      currency_code)
values ('TEST01', 1, localtimestamp, 'CONFIRMED', 99.50, default);

insert into bookings (booking_id, booking_ref, customer_id, booked_at, status, total_amount)
values (null, 'TEST02', 1, localtimestamp, 'CONFIRMED', 12.00);

select booking_id, booking_ref, currency_code from bookings where booking_ref like 'TEST%';
rollback;
