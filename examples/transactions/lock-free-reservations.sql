-- @setup drop table if exists seat_inventory purge
create table seat_inventory (
  flight_id   number primary key,
  seats_left  number reservable constraint seats_left_ck check (seats_left >= 0)
);
insert into seat_inventory values (2800, 10);
commit;

-- this transaction books 2 seats: a reservation, not a row lock ...
update seat_inventory set seats_left = seats_left - 2 where flight_id = 2800;

-- ... so a concurrent transaction can book 3 more without waiting
declare
  pragma autonomous_transaction;
begin
  update seat_inventory set seats_left = seats_left - 3 where flight_id = 2800;
  commit;
end;
/
commit;
select seats_left from seat_inventory where flight_id = 2800;
-- @cleanup drop table if exists seat_inventory purge
