-- @expect-error
-- @setup drop table if exists fare_changes purge
-- @setup create table fare_changes (route_id number, block_minutes number)
-- @setup insert into fare_changes values (1, 395), (1, 399)
merge into routes r
using fare_changes c on (r.route_id = c.route_id)
when matched then update set r.block_minutes = c.block_minutes;
-- @cleanup drop table if exists fare_changes purge
