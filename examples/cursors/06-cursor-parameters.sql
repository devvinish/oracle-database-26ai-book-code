declare
  cursor c_routes (p_origin char, p_min_km number default 0) is
    select destination, distance_km from routes
    where  origin = p_origin and distance_km >= p_min_km
    order  by distance_km desc;
begin
  for r in c_routes('DXB', 12000) loop
    dbms_output.put_line('DXB to ' || r.destination || ': ' || r.distance_km || ' km');
  end loop;
  for r in c_routes(p_origin => 'SYD') loop
    dbms_output.put_line('SYD to ' || r.destination);
  end loop;
end;
/
