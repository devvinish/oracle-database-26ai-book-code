select flight_no, count(*) as tickets,
       count(nullif(checked_in, false)) as checked_in,
       round(100 * count(nullif(checked_in, false)) / nullif(count(*), 0)) as pct
from   tickets join flights using (flight_id)
where  flight_id in (421, 2790)
group  by flight_no;

select 10 / nullif(0, 0) as safe_divide from dual;
