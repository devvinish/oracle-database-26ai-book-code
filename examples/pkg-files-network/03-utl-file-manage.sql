-- @expect-error
declare
  f      utl_file.file_type;
  v_head raw(8);
begin
  utl_file.fcopy('NIMBUS_FILES', 'departures.txt', 'NIMBUS_FILES', 'departures_copy.txt');
  utl_file.frename('NIMBUS_FILES', 'departures_copy.txt',
                   'NIMBUS_FILES', 'departures_old.txt', overwrite => true);
  utl_file.fremove('NIMBUS_FILES', 'departures_old.txt');

  f := utl_file.fopen('NIMBUS_FILES', 'logo.png', 'rb');   -- binary mode
  utl_file.get_raw(f, v_head, 8);
  dbms_output.put_line('logo.png starts ' || rawtohex(v_head) || ', open? '
                       || case when utl_file.is_open(f) then 'yes' end);
  utl_file.fclose(f);

  f := utl_file.fopen('NIMBUS_FILES', 'no_such_file.txt', 'r');
exception
  when utl_file.invalid_operation then
    dbms_output.put_line('cannot open: ' || sqlerrm);
end;
/
