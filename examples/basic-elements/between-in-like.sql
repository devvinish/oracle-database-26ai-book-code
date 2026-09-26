select airport_code, city from airports
where  airport_code between 'D' and 'F'
order  by airport_code;

select flight_no from flights
where  flight_no in ('NM101', 'NM102') and flight_id < 20;

select airport_name from airports
where  airport_name like '%International'
and    airport_name not like 'J%'
and    city like '_e%';
