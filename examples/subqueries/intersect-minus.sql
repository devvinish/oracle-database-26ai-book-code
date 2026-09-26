-- airports that are both an origin and a destination of routes to or from Sydney
select origin from routes where destination = 'SYD'
intersect
select destination from routes where origin = 'SYD';

-- countries with customers but no airport
select country_code from customers
minus
select country_code from airports;

select country_code from customers
except
select country_code from airports;
