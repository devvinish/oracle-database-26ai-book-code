create or replace view flight_board as
select f.flight_id, f.flight_no, r.origin, r.destination,
       f.scheduled_departure, f.status
from   flights f
join   routes r on r.route_id = f.route_id;

select flight_no, origin, destination, to_char(scheduled_departure, 'DD-MON') as day, status
from   flight_board
where  origin = 'SYD'
fetch  first 3 rows only;
