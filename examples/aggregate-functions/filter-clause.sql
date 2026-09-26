select to_char(sys_extract_utc(scheduled_departure), 'YYYY-MM') as month,
       count(*)                                           as flights,
       count(*) filter (where status = 'CANCELLED')       as cancelled,
       count(*) filter (where status = 'ARRIVED')         as arrived,
       sum(distance_km) filter (where status = 'ARRIVED') as km_flown
from   flights join routes using (route_id)
group  by to_char(sys_extract_utc(scheduled_departure), 'YYYY-MM')
order  by month;
