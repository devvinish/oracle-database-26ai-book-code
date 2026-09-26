select to_char(booked_at, 'YYYY-MM') as month, count(*) as bookings,
       sum(count(*)) over (order by to_char(booked_at, 'YYYY-MM')) as running_total,
       round(avg(count(*)) over (order by to_char(booked_at, 'YYYY-MM')
                                 rows between 2 preceding and current row)) as moving_avg_3m
from   bookings
group  by to_char(booked_at, 'YYYY-MM')
order  by month;
