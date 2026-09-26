select n, mod(n, 4) as mod_4, remainder(n, 4) as remainder_4, mod(-n, 4) as mod_neg
from   (values (5), (6), (7), (8), (10)) t (n);

-- employees whose ID is a multiple of 30
select employee_id, last_name from employees where mod(employee_id, 30) = 0;
