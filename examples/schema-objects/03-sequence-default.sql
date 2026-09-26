-- @setup drop table if exists gate_changes purge
create table gate_changes (
  change_id  number default booking_ref_seq.nextval primary key,
  flight_id  number,
  new_gate   varchar2(4)
);
insert into gate_changes (flight_id, new_gate) values (2800, 'B12'), (2801, 'C4');
select * from gate_changes;
-- @cleanup drop table if exists gate_changes purge
-- @cleanup drop sequence if exists booking_ref_seq
