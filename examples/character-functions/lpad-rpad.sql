select rpad(city, 12, '.') || lpad(elevation_ft, 6) as elevation_list,
       lpad('*', round(elevation_ft / 1000) + 1, '*')  as bar
from   airports
where  airport_code in ('DXB', 'DEL', 'BLR', 'NBO', 'JNB')
order  by elevation_ft;

select lpad(employee_id, 8, '0') as padded, rpad('NM', 1) as cut
from   employees
where  employee_id = 100;
