select to_char(true) as bool_true, to_char(1 > 2) as bool_false,
       to_char(n'Café') as from_nchar, to_nchar('Café') as to_nchar,
       to_nchar(date '2026-03-15', 'YYYY-MM-DD') as nchar_date, to_nchar(12.5) as nchar_num
from   dual;
