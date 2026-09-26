-- @expect-error
connect nimbus_app/"Fly#Nimbus2026"@localhost:1521/FREEPDB1

select count(*) as visible_flights from nimbus.flights;
update nimbus.flights set status = status where flight_id = 1;
rollback;
select count(*) from nimbus.customers;
