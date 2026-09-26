-- @expect-error
-- @setup drop table if exists fare_audit purge
create immutable table fare_audit (
  audited_at timestamp default localtimestamp,
  route_id   number,
  old_fare   number,
  new_fare   number
) no drop until 0 days idle
  no delete until 16 days after insert;

insert into fare_audit (route_id, old_fare, new_fare) values (1, 500, 520);
commit;

update fare_audit set new_fare = 999;
delete from fare_audit;
-- @cleanup drop table if exists fare_audit purge
