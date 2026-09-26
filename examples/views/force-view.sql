-- @setup drop view if exists pending_upgrades
-- @setup drop table if exists upgrade_requests purge
create force view pending_upgrades as select * from upgrade_requests;

select object_name, status from user_objects where object_name = 'PENDING_UPGRADES';

create table upgrade_requests (ticket_id number, requested_on date);
alter view pending_upgrades compile;
select object_name, status from user_objects where object_name = 'PENDING_UPGRADES';
-- @cleanup drop view if exists pending_upgrades
-- @cleanup drop table if exists upgrade_requests purge
