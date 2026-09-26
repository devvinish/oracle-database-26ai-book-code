select c.cabin, t.type_code
from   (values ('BUSINESS'), ('ECONOMY')) c (cabin)
cross  join aircraft_types t
where  t.manufacturer = 'Boeing';
