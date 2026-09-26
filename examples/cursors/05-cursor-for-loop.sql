begin
  for r in (select airport_code, city from airports where country_code = 'IN' order by city)
  loop
    dbms_output.put_line(r.airport_code || ' ' || r.city);
  end loop;
end;
/
