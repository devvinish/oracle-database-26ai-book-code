select count(*) as gold_or_better
from   customers
where  json_exists(loyalty, '$?(@.tier == "Gold" || @.tier == "Platinum")');

select customer_id, json_value(loyalty, '$.points') as points
from   customers
where  json_exists(loyalty, '$.favoriteAirports?(@ == $code)' passing 'AKL' as "code")
and    json_exists(loyalty, '$?(@.points > $min)' passing 100000 as "min");
