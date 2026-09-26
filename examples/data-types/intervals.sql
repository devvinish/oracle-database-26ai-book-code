select interval '2-6' year to month                   as ym,
       interval '3 12:30:00' day to second            as ds,
       interval '90' minute                           as minutes,
       interval '250' day(3)                          as days,
       date '2026-03-15' + interval '1-1' year to month as plus_13_months
from   dual;
