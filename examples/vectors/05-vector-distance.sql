select b.airport_code,
       round(vector_distance(a.position, b.position, cosine), 4)    as cosine,
       round(vector_distance(a.position, b.position, euclidean), 4) as euclidean,
       round(vector_distance(a.position, b.position, dot), 4)       as dot,
       round(vector_distance(a.position, b.position, manhattan), 4) as manhattan
from   airport_vectors a, airport_vectors b
where  a.airport_code = 'DXB' and b.airport_code in ('BOM', 'LHR', 'SYD');
