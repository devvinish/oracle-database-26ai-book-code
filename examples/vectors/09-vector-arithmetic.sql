select from_vector(vector('[1, 2, 3]') + vector('[10, 20, 30]'))  as added,
       from_vector(vector('[1, 2, 3]') * vector('[2, 2, 2]'))     as multiplied,
       from_vector(vector('[10, 20, 30]') - vector('[1, 2, 3]'))  as subtracted
from   dual;

select from_vector(avg(position)) as centre_of_india from airport_vectors
where  airport_code in ('BOM', 'DEL', 'BLR');
