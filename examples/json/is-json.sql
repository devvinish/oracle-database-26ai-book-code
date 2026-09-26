select v, case when v is json then 'yes' else 'no' end as is_json,
       case when v is json (strict) then 'yes' else 'no' end as strict_json
from   (values ('{"a":1}'), ('{a:1}'), ('[1,2'), ('"text"')) t (v);
