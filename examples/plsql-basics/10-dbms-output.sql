begin
  dbms_output.put('Nimbus ');
  dbms_output.put('Air');
  dbms_output.new_line;
  dbms_output.put_line(q'[It's "on time"]');
  dbms_output.put_line(null);                    -- an empty line
  dbms_output.put_line(to_char(sysdate, 'YYYY') || ' is the year');
end;
/
