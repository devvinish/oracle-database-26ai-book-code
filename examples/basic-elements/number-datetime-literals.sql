select 42 as integer_literal, -3.75 as decimal_literal, 2.5e3 as scientific,
       1.5f as binary_float, 1.5d as binary_double
from   dual;

select date '2026-03-15'                          as date_literal,
       timestamp '2026-03-15 08:30:00.5'          as ts_literal,
       timestamp '2026-03-15 08:30:00 Asia/Dubai' as tstz_literal
from   dual;

select interval '4' hour as interval_literal, true as boolean_literal from dual;
