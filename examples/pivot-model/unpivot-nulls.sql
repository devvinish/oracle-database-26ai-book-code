select employee_id, measure, value
from   (select employee_id, salary, commission_pct * 100 as commission from employees
        where employee_id in (150, 154))
unpivot include nulls (value for measure in (salary as 'SALARY',
                                            commission as 'COMMISSION %'))
order  by employee_id, measure;
