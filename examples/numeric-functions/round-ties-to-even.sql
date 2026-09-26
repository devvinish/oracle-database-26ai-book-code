select n, round(n) as round, round_ties_to_even(n) as ties_to_even,
       round_ties_to_even(n * 10, -1) / 10 as to_tens
from   (values (0.5), (1.5), (2.5), (3.5), (-2.5)) t (n);
