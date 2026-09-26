select greatest(3, 17, 9) as g, least(3, 17, 9) as l,
       greatest('Dubai', 'Auckland', 'Sydney') as g_text,
       least(date '2026-03-01', date '2026-01-15') as l_date,
       greatest(1, null, 3) as with_null
from   dual;

select employee_id, salary, least(salary * 1.1, 20000) as raise_capped
from   employees
where  employee_id in (151, 112, 154);
