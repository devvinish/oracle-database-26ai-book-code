select json_scalar(42) as num, json_scalar('text') as str,
       json_scalar(date '2026-03-15') as dt,
       json('{"a":1}') as doc, json_serialize(json('[1,2,3]')) as arr
from   dual;
