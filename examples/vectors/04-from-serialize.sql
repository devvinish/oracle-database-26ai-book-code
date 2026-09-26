select from_vector(position returning varchar2(100)) as as_text
from   airport_vectors
where  airport_code = 'KTM';

select vector_serialize(to_vector('[0, 0, 7.5, 0]', 4, float32)
                        returning clob format sparse) as as_sparse
from   dual;
