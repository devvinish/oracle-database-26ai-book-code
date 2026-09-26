select first_name, last_name, salary, commission_pct,
       nvl(commission_pct, 0)                       as commission,
       salary * (1 + nvl(commission_pct, 0))        as with_commission,
       salary * (1 + commission_pct)                as without_nvl
from   employees
where  employee_id in (150, 154, 156);
