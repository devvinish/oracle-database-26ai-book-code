select ticket_id,
       xmlserialize(content prediction_details(cabin_class, 'BUSINESS', 2 using *) indent)
         as details
from   ml_tickets
where  ticket_id = 765;
