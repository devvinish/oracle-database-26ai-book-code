select type_code, cabin, seats
from   aircraft_types
unpivot (seats for cabin in (seats_business as 'BUSINESS', seats_economy as 'ECONOMY'))
where  type_code like 'B%'
order  by type_code, cabin;
