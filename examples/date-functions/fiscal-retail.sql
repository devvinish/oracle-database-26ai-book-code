-- a fiscal year that starts on 1 April
select fiscal_year(d, date '2026-04-01')     as fiscal_year,
       fiscal_quarter(d, date '2026-04-01')  as fiscal_quarter,
       fiscal_month_of_year(d, date '2026-04-01') as fiscal_month_no,
       fiscal_year_start_date(d, date '2026-04-01') as fy_start
from   (select date '2026-03-15' as d);

select retail_year(d) as retail_year, retail_month(d) as retail_month,
       retail_week(d) as retail_week, retail_month_start_date(d) as month_start,
       retail_month_end_date(d) as month_end
from   (select date '2026-03-15' as d);
