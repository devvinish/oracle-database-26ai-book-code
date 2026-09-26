select c.loyalty.favoriteAirports.size()   as favourites,
       c.loyalty.memberSince.date()        as member_since,
       c.loyalty.tier.upper()              as tier_upper,
       c.loyalty.favoriteAirports.type()   as json_type
from   customers c
where  c.customer_id = 1;
