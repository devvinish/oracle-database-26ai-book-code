select d, add_months(d, 1) as plus_1, add_months(d, -1) as minus_1,
       add_months(d, 12) as next_year,
       round(months_between(date '2026-12-31', d), 2) as months_to_year_end
from   (values (date '2026-01-31'), (date '2026-02-28'), (date '2026-03-15')) t (d);
