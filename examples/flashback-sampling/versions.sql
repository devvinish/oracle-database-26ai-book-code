variable start_scn number
exec :start_scn := dbms_flashback.get_system_change_number

update routes set block_minutes = block_minutes + 5 where route_id = 1;
commit;
exec dbms_session.sleep(2)
update routes set block_minutes = block_minutes + 5 where route_id = 1;
commit;

select versions_operation as op, versions_startscn - :start_scn as start_after,
       versions_endscn - :start_scn as end_after, block_minutes
from   routes versions between scn :start_scn and maxvalue
where  route_id = 1
order  by versions_startscn nulls first;
-- @cleanup update routes set block_minutes = 400 where route_id = 1
-- @cleanup commit
-- @cleanup drop table if exists sys_temp_fbt purge
