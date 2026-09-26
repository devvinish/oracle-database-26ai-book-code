declare
  v_module varchar2(64);
  v_action varchar2(64);
  v_client varchar2(64);
begin
  dbms_application_info.set_module(module_name => 'FARE_LOADER',
                                   action_name => 'reading file');
  dbms_application_info.set_action('updating fares');
  dbms_application_info.set_client_info('run for route 12');
  dbms_application_info.read_module(v_module, v_action);
  dbms_application_info.read_client_info(v_client);
  dbms_output.put_line(v_module || ' / ' || v_action || ' / ' || v_client);
end;
/
select module, action, client_info from v$session where sid = sys_context('USERENV', 'SID');
