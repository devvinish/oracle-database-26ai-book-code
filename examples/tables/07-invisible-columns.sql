-- @setup drop table if exists gate_changes purge
create table gate_changes (flight_id number, gate varchar2(4));
alter table gate_changes add (changed_by varchar2(30) invisible default user);

insert into gate_changes values (2800, 'B7');        -- no column list, no invisible column

select * from gate_changes;

select flight_id, gate, changed_by from gate_changes;
-- @cleanup drop table if exists gate_changes purge
