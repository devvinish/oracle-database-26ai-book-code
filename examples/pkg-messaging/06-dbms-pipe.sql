declare
  v_status integer;
  v_flight varchar2(6);
  v_delay  number;
  v_when   date;
begin
  -- the sender: pack items into the message buffer, then send it
  dbms_pipe.pack_message('NM150');
  dbms_pipe.pack_message(45);
  dbms_pipe.pack_message(date '2026-03-15');
  v_status := dbms_pipe.send_message('NIMBUS$DELAYS', timeout => 5);
  dbms_output.put_line('sent: ' || v_status);

  -- the receiver (usually another session): receive, then unpack in the same order
  v_status := dbms_pipe.receive_message('NIMBUS$DELAYS', timeout => 5);
  dbms_output.put_line('received: ' || v_status || ', next item type '
                       || dbms_pipe.next_item_type);         -- 9 = VARCHAR2
  dbms_pipe.unpack_message(v_flight);
  dbms_pipe.unpack_message(v_delay);
  dbms_pipe.unpack_message(v_when);
  dbms_output.put_line(v_flight || ' delayed ' || v_delay || ' minutes on ' || v_when);

  v_status := dbms_pipe.receive_message('NIMBUS$DELAYS', timeout => 0);
  dbms_output.put_line('again: ' || v_status || ' (1 = timed out, nothing there)');
end;
/
