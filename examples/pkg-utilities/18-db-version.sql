begin
  dbms_output.put_line('version ' || dbms_db_version.version || ', release '
                       || dbms_db_version.release);
  dbms_output.put_line('version 23 or later? '
                       || case when dbms_db_version.ver_le_21 then 'no' else 'yes' end);
end;
/
