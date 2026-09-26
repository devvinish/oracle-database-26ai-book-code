select ticket_id, tier, days_ahead, cabin as actual,
       prediction(cabin_class using *)                      as predicted,
       round(prediction_probability(cabin_class using *), 3) as probability,
       round(prediction_probability(cabin_class, 'BUSINESS' using *), 3) as p_business
from   ml_tickets
where  ticket_id in (10, 395, 540, 765, 850, 1005)
order  by ticket_id;
