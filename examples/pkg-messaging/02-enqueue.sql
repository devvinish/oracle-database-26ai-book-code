declare
  v_options dbms_aq.enqueue_options_t;
  v_props   dbms_aq.message_properties_t;
  v_msgid   raw(16);
begin
  v_props.correlation := 'NM150';
  v_props.priority    := 1;                          -- lower numbers are dequeued first
  dbms_aq.enqueue('GATE_Q', v_options, v_props, gate_change_t('NM150', 'A1', 'B12'),
                  v_msgid);

  v_props.correlation := 'NM101';
  v_props.priority    := 5;
  v_props.expiration  := 3600;                       -- seconds, then to the exception queue
  dbms_aq.enqueue('GATE_Q', v_options, v_props, gate_change_t('NM101', 'C3', 'C5'),
                  v_msgid);
  commit;                                            -- visible to consumers from now on
end;
/
select corr_id, msg_priority, msg_state, q.user_data.flight_no as flight,
       q.user_data.new_gate as gate
from   aq$gate_qt q
order  by msg_priority;
