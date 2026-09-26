select v,
       to_number(v default -1 on conversion error)                as num,
       to_date(v default null on conversion error, 'YYYY-MM-DD') as dt,
       cast(v as number default 0 on conversion error)            as cast_num,
       validate_conversion(v as number)                           as is_number,
       validate_conversion(v as date, 'YYYY-MM-DD')               as is_date
from   (values ('42'), ('4x2'), ('2026-03-15'), ('2026-02-30')) t (v);
