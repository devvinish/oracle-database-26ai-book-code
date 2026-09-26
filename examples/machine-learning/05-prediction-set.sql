select t.ticket_id, s.prediction, round(s.probability, 3) as probability
from   ml_tickets t,
       table(prediction_set(cabin_class using *)) s
where  t.ticket_id = 850;
