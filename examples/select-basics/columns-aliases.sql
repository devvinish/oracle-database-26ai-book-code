select type_code,
       manufacturer || ' ' || model           as aircraft,
       seats_business + seats_economy         as seats,
       round(range_km / 1.852)                as "Range (nm)",
       cruise_kmh                             speed
from   aircraft_types;
