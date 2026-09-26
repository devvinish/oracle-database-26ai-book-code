-- @connect sysdba
exec dbms_result_cache.flush
select dbms_result_cache.status as cache_status from dual;

select /*+ result_cache */ count(*) as dxb_routes from nimbus.routes where origin = 'DXB';
select /*+ result_cache */ count(*) as dxb_routes from nimbus.routes where origin = 'DXB';

select status, scan_count as reused from v$result_cache_objects
where  type = 'Result' and name like '%dxb_routes from nimbus.routes%';

-- invalidate the results that depend on ROUTES, as a change to it would
exec dbms_result_cache.invalidate('NIMBUS', 'ROUTES')

select status, scan_count as reused from v$result_cache_objects
where  type = 'Result' and name like '%dxb_routes from nimbus.routes%';
