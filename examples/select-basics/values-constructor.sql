select *
from   (values ('BUSINESS', 1.25), ('ECONOMY', 1.00), ('PREMIUM', 1.10)) t (cabin, factor);

select t.cabin, t.factor, count(*) as tickets
from   tickets k
join   (values ('BUSINESS', 1.25), ('ECONOMY', 1.00)) t (cabin, factor) on t.cabin = k.cabin
group  by t.cabin, t.factor;
