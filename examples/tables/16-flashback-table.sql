-- @setup drop table if exists fare_history purge
-- @setup create table fare_history as select route_id, distance_km, 100 as fare from routes where route_id <= 3
-- @setup alter table fare_history enable row movement
-- @setup begin dbms_session.sleep(15); end;
declare
  v_scn number := dbms_flashback.get_system_change_number;   -- before the mistake
begin
  delete from fare_history;
  commit;
  -- DDL takes no bind variables: build the statement with the SCN in it
  execute immediate 'flashback table fare_history to scn ' || v_scn;
end;
/
select count(*) as rows_back from fare_history;
-- @cleanup drop table if exists fare_history purge
-- @cleanup drop table if exists sys_temp_fbt purge
