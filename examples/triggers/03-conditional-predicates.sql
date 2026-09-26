-- @setup drop table if exists route_audit purge
-- @setup create table route_audit (action varchar2(10), route_id number, detail varchar2(60))
create or replace trigger routes_audit_trg
  after insert or update or delete on routes
  for each row
begin
  if inserting then
    insert into route_audit
    values ('INSERT', :new.route_id, :new.origin || '-' || :new.destination);
  elsif updating('BLOCK_MINUTES') then
    insert into route_audit values ('UPDATE', :new.route_id,
                                    :old.block_minutes || ' -> ' || :new.block_minutes);
  elsif deleting then
    insert into route_audit values ('DELETE', :old.route_id, null);
  end if;
end;
/
insert into routes (origin, destination, distance_km, block_minutes)
values ('DXB', 'KTM', 2600, 250);
update routes set block_minutes = block_minutes + 5 where route_id = 1;
delete from routes where destination = 'KTM';
select * from route_audit;
rollback;
-- @cleanup drop trigger if exists routes_audit_trg
-- @cleanup drop table if exists route_audit purge
