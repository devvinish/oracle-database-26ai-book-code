select rownum, airport_code, city
from   airports
where  rownum <= 3;

-- ROWNUM is assigned before ORDER BY: sort in a subquery first
select rownum, airport_code, elevation_ft
from   (select airport_code, elevation_ft from airports order by elevation_ft desc)
where  rownum <= 3;
