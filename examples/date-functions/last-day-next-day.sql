select d, last_day(d) as month_end, last_day(d) - d as days_left,
       next_day(d, 'FRIDAY') as next_friday, to_char(d, 'Day') as weekday
from   (values (date '2026-02-10'), (date '2026-03-13')) t (d);
