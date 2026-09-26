-- @setup drop table if exists fare_changes purge
-- @setup create table fare_changes (noted_at timestamp default systimestamp, table_name varchar2(100), operation varchar2(20), row_id varchar2(30))
create or replace procedure note_fare_change (ntfnds in cq_notification$_descriptor) is
begin
  for t in 1 .. ntfnds.table_desc_array.count loop
    for r in 1 .. ntfnds.table_desc_array(t).numrows loop
      insert into fare_changes (table_name, operation, row_id)
      values (ntfnds.table_desc_array(t).table_name,
              case when bitand(ntfnds.table_desc_array(t).row_desc_array(r).opflags,
                               dbms_cq_notification.updateop) > 0 then 'UPDATE' end,
              ntfnds.table_desc_array(t).row_desc_array(r).row_id);
    end loop;
  end loop;
  commit;
end;
/
declare
  v_reg  cq_notification$_reg_info;
  v_id   number;
  v_dummy number;
begin
  v_reg := cq_notification$_reg_info('NOTE_FARE_CHANGE',
                                     dbms_cq_notification.qos_rowids, 0, 0, 0);
  v_id := dbms_cq_notification.new_reg_start(v_reg);
  select count(*) into v_dummy from aircraft_types;           -- the tables to watch
  dbms_cq_notification.reg_end;
  dbms_output.put_line('registration ' || case when v_id > 0 then 'created' end);
end;
/
update aircraft_types set range_km = range_km where type_code = 'A20N';
commit;
exec dbms_session.sleep(5)

select table_name, operation from fare_changes;

select table_name from user_change_notification_regs;
-- @cleanup begin for r in (select regid from user_change_notification_regs) loop dbms_cq_notification.deregister(r.regid); end loop; end;
-- @cleanup drop procedure if exists note_fare_change
-- @cleanup drop table if exists fare_changes purge
-- @cleanup begin dbms_aqadm.drop_transactional_event_queue('BOOKING_EVENTS', force => true); end;
-- @cleanup begin dbms_aqadm.drop_queue_table('ALERT_QT', force => true); end;
-- @cleanup begin dbms_aqadm.drop_queue_table('GATE_QT', force => true); end;
-- @cleanup drop type if exists gate_change_t force
