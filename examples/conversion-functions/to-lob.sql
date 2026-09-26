-- @setup drop table if exists view_source purge
-- @setup create or replace view busy_routes as select route_id from routes where distance_km > 10000
create table view_source (view_name varchar2(128), text clob);

insert into view_source
select view_name, to_lob(text) from user_views where view_name = 'BUSY_ROUTES';

select view_name, text from view_source;
-- @cleanup drop table if exists view_source purge
-- @cleanup drop view if exists busy_routes
