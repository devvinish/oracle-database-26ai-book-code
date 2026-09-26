select json_query(loyalty, '$.preferences')                 as preferences,
       json_query(loyalty, '$.favoriteAirports')            as favourites,
       json_query(loyalty, '$.tier' with wrapper)           as tier_in_array,
       json_query(loyalty, '$.favoriteAirports[*]' with conditional wrapper)
         as all_favourites
from   customers
where  customer_id = 1;
