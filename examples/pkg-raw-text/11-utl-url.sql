begin
  dbms_output.put_line(utl_url.escape('https://nimbus.example/fares?seat=aisle 12'));
  dbms_output.put_line(utl_url.escape('Zürich & Genève', true, 'AL32UTF8'));
  dbms_output.put_line(utl_url.unescape('Z%C3%BCrich%20%26%20Gen%C3%A8ve', 'AL32UTF8'));
end;
/
