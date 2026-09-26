-- airports connected to Singapore in either direction, and how many routes link them
select neighbour, count(*) as routes
from   graph_table (nimbus_network
         match (a is airport where a.airport_code = 'SIN') -[r is route]- (b is airport)
         columns (b.airport_code as neighbour)
       )
group  by neighbour
order  by neighbour;
