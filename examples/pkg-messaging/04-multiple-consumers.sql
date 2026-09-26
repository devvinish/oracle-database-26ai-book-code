-- @setup begin dbms_aqadm.drop_queue_table('ALERT_QT', force => true); exception when others then null; end;
begin
  dbms_aqadm.create_queue_table('ALERT_QT', 'GATE_CHANGE_T', multiple_consumers => true);
  dbms_aqadm.create_queue('ALERT_Q', 'ALERT_QT');
  dbms_aqadm.start_queue('ALERT_Q');
  dbms_aqadm.add_subscriber('ALERT_Q', sys.aq$_agent('CREW_APP', null, null));
  dbms_aqadm.add_subscriber('ALERT_Q', sys.aq$_agent('PAX_APP', null, null),
                            rule => q'[tab.user_data.flight_no like 'NM1%']');
end;
/
declare
  v_enq   dbms_aq.enqueue_options_t;
  v_deq   dbms_aq.dequeue_options_t;
  v_props dbms_aq.message_properties_t;
  v_msg   gate_change_t;
  v_msgid raw(16);
begin
  dbms_aq.enqueue('ALERT_Q', v_enq, v_props, gate_change_t('NM150', 'A1', 'B12'), v_msgid);
  dbms_aq.enqueue('ALERT_Q', v_enq, v_props, gate_change_t('NM205', 'D2', 'D4'), v_msgid);
  commit;
  v_deq.wait := dbms_aq.no_wait;
  for c in (select column_value as consumer
            from   sys.odcivarchar2list('CREW_APP', 'PAX_APP')) loop
    v_deq.consumer_name := c.consumer;
    v_deq.navigation    := dbms_aq.first_message;       -- start again for each consumer
    begin
      loop
        dbms_aq.dequeue('ALERT_Q', v_deq, v_props, v_msg, v_msgid);
        dbms_output.put_line(rpad(c.consumer, 10) || v_msg.flight_no || ' -> '
                             || v_msg.new_gate);
      end loop;
    exception
      when others then if sqlcode != -25228 then raise; end if;
    end;
  end loop;
  commit;
end;
/
