select trunc(d)          as trunc_day,
       trunc(d, 'MM')    as month_start,
       trunc(d, 'Q')     as quarter_start,
       trunc(d, 'IW')    as iso_week_start,
       round(d, 'MM')    as round_month,
       round(d, 'YYYY')  as round_year
from   (select to_date('2026-08-19 16:45', 'YYYY-MM-DD HH24:MI') as d);

select to_char(trunc(d, 'HH'), 'HH24:MI') as trunc_hour,
       to_char(round(d, 'HH'), 'HH24:MI') as round_hour,
       to_char(ceil(d, 'HH'), 'HH24:MI')  as ceil_hour,
       to_char(floor(d, 'DD'), 'DD-MON HH24:MI') as floor_day
from   (select to_date('2026-08-19 16:45', 'YYYY-MM-DD HH24:MI') as d);
