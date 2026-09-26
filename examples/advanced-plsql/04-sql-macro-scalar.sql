create or replace function minutes_between (p_from timestamp with time zone,
                                            p_to   timestamp with time zone)
  return varchar2 sql_macro(scalar)
is
begin
  return 'extract(day from (p_to - p_from)) * 1440
          + extract(hour from (p_to - p_from)) * 60
          + extract(minute from (p_to - p_from))';
end;
/
select flight_no, minutes_between(scheduled_departure, scheduled_arrival) as block
from   flights
where  flight_id <= 3;
