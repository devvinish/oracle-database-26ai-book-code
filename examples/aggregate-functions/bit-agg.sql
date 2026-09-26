-- service flags per route: 1 = snacks, 2 = hot meal, 4 = bar, 8 = Wi-Fi
select bit_and_agg(flags) as on_every_flight,
       bit_or_agg(flags)  as on_some_flight,
       bit_xor_agg(flags) as xor
from   (values (3), (7), (15), (11)) t (flags);
