create or replace view ml_tickets as
select t.ticket_id,
       t.cabin,
       nvl(json_value(c.loyalty, '$.tier'), 'None')              as tier,
       nvl(json_value(c.loyalty, '$.points' returning number), 0) as points,
       trunc(cast(f.scheduled_departure as date) - cast(b.booked_at as date)) as days_ahead,
       r.distance_km,
       (select count(*) from tickets t2 where t2.booking_id = t.booking_id) as legs,
       trunc(months_between(date '2026-03-15', c.date_of_birth) / 12)   as age
from   tickets t
join   bookings b  on b.booking_id = t.booking_id
join   customers c on c.customer_id = b.customer_id
join   flights f   on f.flight_id = t.flight_id
join   routes r    on r.route_id = f.route_id;

select * from ml_tickets where ticket_id <= 4;
