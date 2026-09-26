declare
  v_city     airports.city%type;
  v_airport  airports%rowtype;
begin
  select city into v_city from airports where airport_code = 'KTM';
  select * into v_airport from airports where airport_code = 'NBO';
  dbms_output.put_line(v_city || ', and ' || v_airport.city || ' at '
                       || v_airport.elevation_ft || ' ft');
end;
/
