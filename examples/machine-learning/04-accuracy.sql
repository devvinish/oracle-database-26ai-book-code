-- the tickets that the model did not see: ticket_id divisible by 5
select cabin as actual, prediction(cabin_class using *) as predicted, count(*) as tickets
from   ml_tickets
where  mod(ticket_id, 5) = 0
group  by cabin, prediction(cabin_class using *)
order  by 1, 2;
