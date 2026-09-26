-- @setup create or replace view flight_status_v as select f.flight_id, f.flight_no, r.origin, f.status from flights f join routes r on r.route_id = f.route_id
create or replace trigger flight_status_v_trg
  instead of update on flight_status_v
  for each row
begin
  update flights set status = :new.status where flight_id = :old.flight_id;
end;
/
update flight_status_v set status = 'CANCELLED', origin = 'XXX' where flight_id = 2800;
select flight_id, status from flights where flight_id = 2800;
rollback;
-- @cleanup drop view if exists flight_status_v
