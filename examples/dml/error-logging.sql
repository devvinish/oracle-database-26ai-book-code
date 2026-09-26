-- @setup drop table if exists err$_routes purge
exec dbms_errlog.create_error_log('ROUTES')

insert into routes (origin, destination, distance_km, block_minutes)
select 'DXB', airport_code, 1000, 100 from airports where country_code in ('NP', 'IN')
log errors into err$_routes ('load of 26 Sep') reject limit unlimited;

select ora_err_number$ as error, ora_err_tag$ as tag, destination from err$_routes;
rollback;
-- @cleanup drop table if exists err$_routes purge
