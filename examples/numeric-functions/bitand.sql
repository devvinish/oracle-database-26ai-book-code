-- meal service flags: 1 = snacks, 2 = hot meal, 4 = bar, 8 = Wi-Fi
select code, bitand(code, 2) as hot_meal, bitand(code, 8) as wifi,
       case when bitand(code, 2 + 4) = 6 then 'meal and bar' end as full_service
from   (values (3), (6), (15), (8)) t (code);
