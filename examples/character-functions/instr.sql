select email,
       instr(email, '@')              as at_sign,
       instr(email, '.')              as first_dot,
       instr(email, '.', -1)          as last_dot,
       instr(email, '.', 1, 2)        as second_dot,
       substr(email, 1, instr(email, '@') - 1) as user_name
from   customers
where  customer_id = 7;
