declare
  type t_leg is record (
    origin       char(3),
    destination  char(3),
    km           number := 0
  );
  type t_trip is record (outbound t_leg, inbound t_leg);
  v_trip t_trip;
begin
  v_trip.outbound := t_leg('DXB', 'LHR', 5497);
  v_trip.inbound  := t_leg(origin => 'LHR', destination => 'DXB', km => 5497);
  dbms_output.put_line(v_trip.outbound.origin || '>' || v_trip.outbound.destination
                       || '>' || v_trip.inbound.destination || ': '
                       || (v_trip.outbound.km + v_trip.inbound.km) || ' km');
end;
/
