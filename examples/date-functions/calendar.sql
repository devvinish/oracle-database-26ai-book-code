select calendar_year(d) as year, calendar_quarter(d) as quarter,
       calendar_month(d) as month, calendar_week(d) as week, calendar_day(d) as day
from   (select date '2026-03-15' as d);

select calendar_quarter_start_date(d) as q_start, calendar_quarter_end_date(d) as q_end,
       calendar_day_of_year(d) as day_of_year, calendar_week_of_year(d) as week_of_year,
       calendar_add_months(d, 2) as plus_2_months
from   (select date '2026-03-15' as d);
