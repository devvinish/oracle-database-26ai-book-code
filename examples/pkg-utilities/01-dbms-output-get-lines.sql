declare
  v_lines dbms_output.chararr;
  v_count integer := 10;
begin
  dbms_output.put_line('first message');
  dbms_output.put_line('second message');
  dbms_output.get_lines(v_lines, v_count);        -- read the buffer back, emptying it

  dbms_output.disable;                  -- turns output off and discards the buffer
  dbms_output.put_line('lost');
  dbms_output.enable(buffer_size => null);        -- on again, unlimited buffer
  dbms_output.put_line('read ' || v_count || ' lines; the first was "'
                       || v_lines(1) || '"');
end;
/
