select c.customer_id, c.loyalty.tier.string() as tier, c.loyalty.points.number() as points,
       c.loyalty.preferences.seat as seat, c.loyalty.favoriteAirports[0] as first_favourite
from   customers c
where  c.customer_id <= 4;
