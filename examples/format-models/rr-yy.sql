select to_char(to_date('15-MAR-95', 'DD-MON-YY'), 'YYYY') as yy_95,
       to_char(to_date('15-MAR-95', 'DD-MON-RR'), 'YYYY') as rr_95,
       to_char(to_date('15-MAR-49', 'DD-MON-RR'), 'YYYY') as rr_49,
       to_char(to_date('15-MAR-50', 'DD-MON-RR'), 'YYYY') as rr_50
from   dual;
