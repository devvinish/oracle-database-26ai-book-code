select airport_code, elevation_ft,
       case
         when elevation_ft > 5000 then 'High'
         when elevation_ft > 1000 then 'Medium'
         else 'Low'
       end as altitude,
       case country_code
         when 'IN' then 'Domestic'
         when 'AE' then 'Home'
         else 'International'
       end as market
from   airports
where  airport_code in ('DXB', 'BLR', 'DEL', 'JNB');
