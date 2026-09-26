select airport_code, ora_hash(airport_code) as hash,
       ora_hash(airport_code, 3) as bucket_0_to_3,
       ora_hash(airport_code, 3, 42) as other_seed
from   airports
where  airport_code in ('DXB', 'LHR', 'SIN', 'SYD');
