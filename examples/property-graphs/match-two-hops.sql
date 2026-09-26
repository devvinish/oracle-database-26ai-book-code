-- from Auckland to London with exactly one change
select *
from   graph_table (nimbus_network
         match (a is airport) -[r1 is route]-> (via is airport)
                              -[r2 is route]-> (b is airport)
         where a.airport_code = 'AKL' and b.airport_code = 'LHR'
         columns (via.airport_code as change_at,
                  r1.distance_km + r2.distance_km as total_km)
       )
order  by total_km;
