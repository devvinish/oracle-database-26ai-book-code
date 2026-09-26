select to_char(date '2026-03-05', 'Month DD')      as padded,
       to_char(date '2026-03-05', 'fmMonth DD')    as fill_mode,
       to_char(date '2026-03-05', 'fmDdspth "of" Month') as spelled,
       to_char(date '2026-03-05', 'DDth')          as ordinal
from   dual;

select to_date('5/3/2026', 'DD/MM/YYYY') as lenient from dual;
