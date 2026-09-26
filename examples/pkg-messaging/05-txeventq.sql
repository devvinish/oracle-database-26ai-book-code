-- @setup begin dbms_aqadm.drop_transactional_event_queue('BOOKING_EVENTS', force => true); exception when others then null; end;
begin
  dbms_aqadm.create_transactional_event_queue(
    queue_name         => 'BOOKING_EVENTS',
    queue_payload_type => 'JSON',
    multiple_consumers => true);
  dbms_aqadm.add_subscriber('BOOKING_EVENTS', sys.aq$_agent('LOYALTY', null, null));
  dbms_aqadm.start_queue('BOOKING_EVENTS');
end;
/
declare
  v_enq   dbms_aq.enqueue_options_t;
  v_deq   dbms_aq.dequeue_options_t;
  v_props dbms_aq.message_properties_t;
  v_doc   json;
  v_msgid raw(16);
begin
  dbms_aq.enqueue('BOOKING_EVENTS', v_enq, v_props,
                  json('{"event":"booked","ref":"NX7Q2P","miles":1250}'), v_msgid);
  commit;
  v_deq.consumer_name := 'LOYALTY';
  v_deq.wait          := 5;
  dbms_aq.dequeue('BOOKING_EVENTS', v_deq, v_props, v_doc, v_msgid);
  commit;
  dbms_output.put_line('LOYALTY received ' || json_serialize(v_doc));
end;
/
select name, queue_type, sharded from user_queues where name = 'BOOKING_EVENTS';
