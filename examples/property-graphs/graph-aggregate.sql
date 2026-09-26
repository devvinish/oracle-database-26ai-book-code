-- hubs: airports with the most routes out
select airport, count(*) as routes_out
from   graph_table (nimbus_network
         match (a is airport) -[r is route]-> (b)
         columns (a.airport_code as airport)
       )
group  by airport
order  by routes_out desc, airport
fetch  first 5 rows only;
