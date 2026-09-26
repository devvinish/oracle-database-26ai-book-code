select airport_code, city
from   airports
where  airport_code in (select destination from routes where distance_km > 12000);
