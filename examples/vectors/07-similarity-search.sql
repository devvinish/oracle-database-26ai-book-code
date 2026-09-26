-- the five airports nearest to Kathmandu, by the angle between their positions
select b.airport_code, b.city,
       round(vector_distance(b.position, k.position, cosine), 5) as distance
from   airport_vectors b, airport_vectors k
where  k.airport_code = 'KTM' and b.airport_code <> 'KTM'
order  by vector_distance(b.position, k.position, cosine)
fetch  exact first 5 rows only;
