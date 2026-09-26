declare
  v_message varchar2(1800);
  v_status  integer;
begin
  dbms_alert.register('FLIGHT_CANCELLED');                -- this session wants to know
  dbms_alert.signal('FLIGHT_CANCELLED', 'NM205 cancelled: crew shortage');
  commit;                                                 -- alerts are sent on commit
  dbms_alert.waitone('FLIGHT_CANCELLED', v_message, v_status, timeout => 5);
  dbms_output.put_line('status ' || v_status || ': ' || v_message);
  dbms_alert.waitone('FLIGHT_CANCELLED', v_message, v_status, timeout => 1);
  dbms_output.put_line('status ' || v_status || ' (1 = timed out)');
  dbms_alert.remove('FLIGHT_CANCELLED');
end;
/
