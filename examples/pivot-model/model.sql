-- project the next two months of bookings: each month = previous month plus 10%
select month, bookings
from   (select to_number(to_char(booked_at, 'YYYYMM')) as month, count(*) as bookings
        from bookings where booked_at >= date '2026-01-01'
        group by to_number(to_char(booked_at, 'YYYYMM')))
model
  dimension by (month)
  measures (bookings)
  rules (
    bookings[202604] = round(bookings[202603] * 1.1),
    bookings[202605] = round(bookings[202604] * 1.1)
  )
order  by month;
