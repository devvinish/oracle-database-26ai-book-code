connect nimbus_app/"Fly#Nimbus2026"@localhost:1521/FREEPDB1

select role from session_roles;
select count(*) as customers_now_visible from nimbus.customers;
