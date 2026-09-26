select *
from   graph_table (nimbus_network
         match (a is airport where a.airport_code = 'AKL') -[r is route]-> (b is airport)
         columns (b.airport_code as destination, b.city, r.distance_km)
       )
order  by distance_km;
