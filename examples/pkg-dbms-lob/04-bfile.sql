declare
  v_file  bfile := bfilename('NIMBUS_FILES', 'welcome.txt');
  v_dir   varchar2(128);
  v_name  varchar2(128);
begin
  if dbms_lob.fileexists(v_file) = 1 then
    dbms_lob.fileopen(v_file, dbms_lob.file_readonly);
    dbms_lob.filegetname(v_file, v_dir, v_name);
    dbms_output.put_line(v_dir || '/' || v_name || ': ' || dbms_lob.getlength(v_file)
                         || ' bytes, open? ' || dbms_lob.fileisopen(v_file));
    dbms_output.put_line(utl_raw.cast_to_varchar2(dbms_lob.substr(v_file, 26, 1)));
    dbms_lob.fileclose(v_file);
  end if;
end;
/
