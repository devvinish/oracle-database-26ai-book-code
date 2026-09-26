declare
  v_msg varchar2(512);
  v_rc  pls_integer;
begin
  v_rc := utl_lms.get_message(1403, 'rdbms', 'ora', null, v_msg);
  dbms_output.put_line('error 1403: ' || v_msg);
  v_rc := utl_lms.get_message(1, 'rdbms', 'ora', 'german', v_msg);
  dbms_output.put_line('error 1, in German: ' || v_msg);
  dbms_output.put_line(utl_lms.format_message('Flight %s is %d minutes late', 'NM150', 45));
end;
/
