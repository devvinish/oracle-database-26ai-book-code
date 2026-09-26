create or replace function flight_minutes (p_flight_id number) return number is
  v_minutes number;
begin
  select extract(hour from (scheduled_arrival - scheduled_departure)) * 60
         + extract(minute from (scheduled_arrival - scheduled_departure))
  into   v_minutes
  from   flights
  where  flight_id = p_flight_id;
  return v_minutes;
end;
/
select flight_no, flight_minutes(flight_id) as minutes from flights where flight_id <= 3;
