declare
  v_options dbms_aq.dequeue_options_t;
  v_props   dbms_aq.message_properties_t;
  v_msg     gate_change_t;
  v_msgid   raw(16);
  e_no_more exception;
  pragma exception_init(e_no_more, -25228);          -- timeout or end of fetch
begin
  v_options.wait       := dbms_aq.no_wait;
  v_options.navigation := dbms_aq.first_message;
  loop
    dbms_aq.dequeue('GATE_Q', v_options, v_props, v_msg, v_msgid);
    dbms_output.put_line(v_msg.flight_no || ': gate ' || v_msg.old_gate || ' -> '
                         || v_msg.new_gate || ' (priority ' || v_props.priority || ')');
  end loop;
exception
  when e_no_more then
    commit;                                          -- the dequeued messages are removed
    dbms_output.put_line('queue is empty');
end;
/
