select airport_code, elevation_ft,
       elevation_ft > 1000                       as is_high,
       is_hub or country_code = 'IN'             as hub_or_india,
       (elevation_ft > 1000) is true             as is_true_test
from   airports
where  airport_code in ('DXB', 'BLR', 'LHR');
