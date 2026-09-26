-- Oracle's older outer join syntax: (+) marks the side that may be missing
select a.airport_code, a.city, r.destination
from   airports a, routes r
where  r.origin (+) = a.airport_code
and    a.airport_code in ('KTM', 'AKL');
