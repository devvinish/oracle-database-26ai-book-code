declare
  type t_city_by_code is table of varchar2(40) index by varchar2(3);
  v_cities t_city_by_code;
  v_code   varchar2(3);
begin
  for a in (select airport_code, city from airports where country_code in ('IN', 'US')) loop
    v_cities(a.airport_code) := a.city;
  end loop;

  dbms_output.put_line('BOM is ' || v_cities('BOM') || '; ' || v_cities.count || ' cities');
  v_code := v_cities.first;                        -- keys come back sorted
  while v_code is not null loop
    dbms_output.put_line(v_code || ' ' || v_cities(v_code));
    v_code := v_cities.next(v_code);
  end loop;
end;
/
