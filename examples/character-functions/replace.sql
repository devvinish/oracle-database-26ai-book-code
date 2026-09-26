select airport_name,
       replace(airport_name, 'International', 'Intl.') as short_name,
       replace(airport_name, ' International')        as removed
from   airports
where  airport_code in ('JFK', 'ORD', 'DEL');
