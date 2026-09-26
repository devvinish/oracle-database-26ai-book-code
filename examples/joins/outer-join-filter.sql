-- a condition on the outer table in WHERE turns the outer join into an inner join
select a.airport_code, r.destination
from   airports a left join routes r on r.origin = a.airport_code
where  a.airport_code in ('KTM', 'AKL') and r.distance_km > 1000;

-- put it in the ON clause to keep the outer rows
select a.airport_code, r.destination
from   airports a left join routes r on r.origin = a.airport_code and r.distance_km > 1000
where  a.airport_code in ('KTM', 'AKL');
