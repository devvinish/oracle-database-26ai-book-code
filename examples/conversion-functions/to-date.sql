select to_date('15/03/2026', 'DD/MM/YYYY')                       as d1,
       to_char(to_date('2026-03-15 14:05', 'YYYY-MM-DD HH24:MI'),
               'DD-MON-YYYY HH24:MI')                           as d2,
       to_date('March 15, 2026', 'Month DD, YYYY')              as d3,
       to_date('15-MAR-26', 'DD-MON-RR')                        as rr_year,
       to_date('2461115', 'J')                                  as julian
from   dual;
