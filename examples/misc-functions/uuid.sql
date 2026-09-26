select uuid()                 as uuid_raw,
       raw_to_uuid(uuid())    as uuid_text
from   dual;

select v, is_uuid(v) as valid
from   (values ('123e4567-e89b-42d3-a456-426614174000'),
               ('123E4567E89B42D3A456426614174000'), ('not-a-uuid')) t (v);

select uuid_to_raw('123e4567-e89b-42d3-a456-426614174000') as as_raw from dual;
