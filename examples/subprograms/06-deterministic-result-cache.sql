create or replace function km_to_miles (p_km number) return number
  deterministic
is
begin
  return round(p_km / 1.609344);
end;
/
create or replace function airport_city (p_code char) return varchar2
  result_cache
is
  v_city airports.city%type;
begin
  select city into v_city from airports where airport_code = p_code;
  return v_city;
end;
/
select origin, airport_city(origin) as city, distance_km, km_to_miles(distance_km) as miles
from   routes
where  route_id <= 3;
