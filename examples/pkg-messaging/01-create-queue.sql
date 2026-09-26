-- @setup begin dbms_aqadm.drop_queue_table('GATE_QT', force => true); exception when others then null; end;
-- @setup drop type if exists gate_change_t force
create type gate_change_t as object (
  flight_no varchar2(6),
  old_gate  varchar2(4),
  new_gate  varchar2(4)
);
/
begin
  dbms_aqadm.create_queue_table(queue_table        => 'GATE_QT',
                                queue_payload_type => 'GATE_CHANGE_T');
  dbms_aqadm.create_queue(queue_name => 'GATE_Q', queue_table => 'GATE_QT',
                          max_retries => 3);
  dbms_aqadm.start_queue('GATE_Q');
end;
/
select name, queue_type, max_retries,
       trim(enqueue_enabled) as enq, trim(dequeue_enabled) as deq
from   user_queues
where  queue_table = 'GATE_QT';
