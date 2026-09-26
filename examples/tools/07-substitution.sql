set define on verify on
define origin = 'SYD'
select destination, distance_km from routes where origin = '&origin';

define route_no = 5
select count(*) as flights from flights where route_id = &&route_no;
undefine route_no
