select city, length(city) as chars, lengthb(city) as bytes,
       length('') as empty_string, length(' ') as one_space
from   airports
where  airport_code in ('GRU', 'DXB');
