begin
  dbms_session.set_identifier('agent-042');               -- end-user identity for auditing
  dbms_session.set_nls('nls_date_format', '''YYYY-MM-DD''');
  dbms_output.put_line('client id: ' || sys_context('USERENV', 'CLIENT_IDENTIFIER'));
  dbms_output.put_line('today: ' || sysdate);
  dbms_output.put_line('session id: ' || dbms_session.unique_session_id);
  dbms_output.put_line('DB_DEVELOPER_ROLE enabled? '
                       || case when dbms_session.is_role_enabled('DB_DEVELOPER_ROLE')
                               then 'yes' else 'no' end);
  dbms_session.sleep(0.5);
  dbms_session.clear_identifier;
end;
/
