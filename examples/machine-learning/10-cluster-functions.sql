select customer_id, bookings, spent,
       cluster_id(customer_segments using *)                        as segment,
       round(cluster_probability(customer_segments using *), 3)     as probability,
       round(cluster_distance(customer_segments using *), 3)        as distance
from   ml_customers
where  customer_id in (1, 2, 50, 90);

select s.cluster_id, round(s.probability, 3) as probability
from   ml_customers m, table(cluster_set(customer_segments using *)) s
where  m.customer_id = 50;
