select first_name, commission_pct,
       nvl2(commission_pct, 'Sales, ' || commission_pct * 100 || '%', 'Salary only')
         as pay_plan
from   employees
where  employee_id in (150, 154, 156);
