select vector('[1, 2, 3]', 3, int8)                    as int8_vector,
       vector('[1.5, 2.5]', *, float64)                as any_dims,
       to_vector('[170]', 8, binary)                   as binary_8_bits
from   dual;

select to_vector('[5, [1, 4], [0.5, 0.25]]', 5, float32, sparse) as sparse_vector,
       vector_dimension_count(to_vector('[5, [1, 4], [0.5, 0.25]]', 5, float32, sparse))
         as dims
from   dual;
