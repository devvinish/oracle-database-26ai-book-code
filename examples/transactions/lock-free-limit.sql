-- @expect-error
-- @setup drop table if exists seat_inventory purge
-- @setup create table seat_inventory (flight_id number primary key, seats_left number reservable constraint seats_left_ck check (seats_left >= 0))
-- @setup insert into seat_inventory values (2800, 4)
-- @setup commit
update seat_inventory set seats_left = seats_left - 3 where flight_id = 2800;

-- a second booking of 3 would take the seats below zero: the reservation is refused
declare
  pragma autonomous_transaction;
begin
  update seat_inventory set seats_left = seats_left - 3 where flight_id = 2800;
  commit;
end;
/
rollback;
-- @cleanup drop table if exists seat_inventory purge
