select to_char(booked_at, 'YYYY-MM-DD') as day, total_amount,
       sum(total_amount) over (order by booked_at rows between 1 preceding and 1 following)
         as rows_3,
       count(*) over (order by cast(booked_at as date)
                      range between interval '1' day preceding and current row) as last_24h
from   bookings
where  booking_id <= 8;
