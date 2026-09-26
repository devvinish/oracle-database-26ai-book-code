-- from Auckland to London with one to three flights; the path as a list of airports
select *
from   graph_table (nimbus_network
         match (a is airport where a.airport_code = 'AKL')
               -[r is route]->{1,3}
               (b is airport where b.airport_code = 'LHR')
         columns (listagg(r.distance_km, ' + ') as legs_km,
                  sum(r.distance_km)             as total_km,
                  count(r.distance_km)           as flights)
       )
order  by total_km
fetch  first 4 rows only;
