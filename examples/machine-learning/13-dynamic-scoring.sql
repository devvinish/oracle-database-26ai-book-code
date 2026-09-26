-- no model: the analytic form builds a temporary model for the query
select ticket_id, cabin,
       prediction(for cabin using tier, days_ahead, distance_km) over () as predicted
from   ml_tickets
where  ticket_id in (10, 395, 765, 850);
