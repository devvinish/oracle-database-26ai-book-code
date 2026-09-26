-- @setup drop table if exists travel_notes purge
create json collection table travel_notes;

insert into travel_notes
values ('{"customer":1,"note":"Prefers window seat on night flights"}');
insert into travel_notes
values (json {'customer' : 2, 'note' : 'Travels with a guide dog'});

select json_serialize(data) as doc from travel_notes;

select json_id('OID') as new_oid, json_id('UUID') as new_uuid;

select t.data.customer, t.data.note from travel_notes t where t.data.customer = 2;
-- @cleanup drop table if exists travel_notes purge
