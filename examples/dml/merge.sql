-- @setup drop table if exists route_plan purge
-- @setup drop table if exists plan_changes purge
-- @setup create table route_plan as select route_id, origin, destination, block_minutes from routes where route_id <= 3
-- @setup create table plan_changes (route_id number, origin char(3), destination char(3), block_minutes number)
-- @setup insert into plan_changes values (1, 'DXB', 'LHR', 395), (2, 'LHR', 'DXB', 410), (99, 'DXB', 'KTM', 250)
merge into route_plan r
using plan_changes c
on    (r.route_id = c.route_id)
when matched then
  update set r.block_minutes = c.block_minutes
  delete where r.block_minutes > 400
when not matched then
  insert (route_id, origin, destination, block_minutes)
  values (c.route_id, c.origin, c.destination, c.block_minutes);

select * from route_plan order by route_id;
-- @cleanup drop table if exists route_plan purge
-- @cleanup drop table if exists plan_changes purge
