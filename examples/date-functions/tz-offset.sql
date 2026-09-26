select airport_code, time_zone, tz_offset(time_zone) as offset_today
from   airports
where  airport_code in ('KTM', 'BOM', 'DXB', 'LHR', 'JFK', 'SYD')
order  by longitude;

select to_char(new_time(to_date('2026-03-15 12:00', 'YYYY-MM-DD HH24:MI'), 'GMT', 'PST'),
               'DD-MON-YYYY HH24:MI') as pst
from   dual;
