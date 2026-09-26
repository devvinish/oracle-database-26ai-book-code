create or replace function flights_on (p_route_id number, p_day date)
  return sys_refcursor
is
  c sys_refcursor;
begin
  open c for
    select flight_no, to_char(scheduled_departure, 'HH24:MI TZR') as departs, status
    from   flights
    where  route_id = p_route_id
    and    trunc(cast(scheduled_departure as date)) = p_day;
  return c;
end;
/
variable rc refcursor
exec :rc := flights_on(1, date '2026-03-10')
print rc
