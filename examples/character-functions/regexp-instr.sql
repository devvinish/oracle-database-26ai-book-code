select phone,
       regexp_instr(phone, '\d')              as first_digit,
       regexp_instr(phone, ' ', 1, 2)         as second_space,
       regexp_instr(phone, '\d{4}$')          as last_group,
       regexp_instr(phone, '\d{4}$', 1, 1, 1) as after_last_group
from   customers
where  customer_id = 1;
