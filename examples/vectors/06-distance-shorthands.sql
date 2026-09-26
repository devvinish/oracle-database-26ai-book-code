select b.airport_code as code,
       round(cosine_distance(a.position, b.position), 4)  as cosine,
       round(l2_distance(a.position, b.position), 4)      as l2,
       round(l1_distance(a.position, b.position), 4)      as l1,
       round(inner_product(a.position, b.position), 4)    as dot,
       round(a.position <=> b.position, 4)                as "<=>",
       round(a.position <-> b.position, 4)                as "<->"
from   airport_vectors a, airport_vectors b
where  a.airport_code = 'DXB' and b.airport_code = 'LHR';
