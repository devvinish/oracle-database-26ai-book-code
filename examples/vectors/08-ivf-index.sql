-- @setup drop index if exists airport_vectors_ivf
create vector index airport_vectors_ivf on airport_vectors (position)
  organization neighbor partitions
  distance cosine
  with target accuracy 90;

select index_name, index_type, index_subtype
from   user_indexes
where  table_name = 'AIRPORT_VECTORS';

select b.airport_code
from   airport_vectors b
order  by vector_distance(b.position, (select position from airport_vectors
                                        where airport_code = 'KTM'), cosine)
fetch  approx first 4 rows only with target accuracy 80;
-- @cleanup drop index if exists airport_vectors_ivf
