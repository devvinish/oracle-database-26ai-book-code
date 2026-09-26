variable scn number
exec :scn := dbms_flashback.get_system_change_number

update routes set block_minutes = block_minutes + 30 where origin = 'DXB';
commit;

select sum(block_minutes) as dxb_minutes_now from routes where origin = 'DXB';

-- from now on, every query of the session sees the database as it was at :scn
exec dbms_flashback.enable_at_system_change_number(:scn)
select sum(block_minutes) as dxb_minutes_then from routes where origin = 'DXB';
exec dbms_flashback.disable

update routes set block_minutes = block_minutes - 30 where origin = 'DXB';
commit;
