begin
  dbms_warning.set_warning_setting_string('ENABLE:PERFORMANCE', 'SESSION');
  dbms_warning.add_warning_setting_num(6002, 'ERROR', 'SESSION');   -- unreachable code
  dbms_output.put_line(dbms_warning.get_warning_setting_string);
  dbms_output.put_line('PLW-06002 is: ' || dbms_warning.get_warning_setting_num(6002));
  dbms_output.put_line('category of PLW-07204: ' || dbms_warning.get_category(7204));
end;
/
