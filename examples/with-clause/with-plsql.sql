with
  function minutes(p_interval interval day to second) return number is
  begin
    return extract(day from p_interval) * 1440 + extract(hour from p_interval) * 60
           + extract(minute from p_interval);
  end;
select flight_no, minutes(scheduled_arrival - scheduled_departure) as block_minutes
from   flights
where  flight_id in (1, 2, 3)
/
