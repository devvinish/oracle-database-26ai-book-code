select count(*) as all_employees,
       count(case when commission_pct = null then 1 end)      as equals_null,
       count(case when commission_pct is null then 1 end)     as is_null,
       count(case when commission_pct <> 0.05 then 1 end)     as not_5_percent,
       count(case when decode(commission_pct, 0.05, 1, 0) = 0 then 1 end) as decode_not_5
from   employees;
