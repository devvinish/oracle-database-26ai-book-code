select level as n, date '2026-03-01' + level - 1 as day
from   dual
connect by level <= 5;
