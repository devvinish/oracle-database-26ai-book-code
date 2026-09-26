select vector_dimension_count(position)  as dims,
       vector_dims(position)             as dims_alias,
       vector_dimension_format(position) as format,
       round(vector_norm(position), 4)   as norm
from   airport_vectors
where  airport_code = 'DXB';
