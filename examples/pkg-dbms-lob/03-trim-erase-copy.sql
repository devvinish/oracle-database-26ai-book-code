declare
  v_a clob;
  v_b clob;
  v_amount integer := 5;
begin
  dbms_lob.createtemporary(v_a, true);
  dbms_lob.createtemporary(v_b, true);
  dbms_lob.writeappend(v_a, 26, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ');
  dbms_lob.copy(v_b, v_a, 10, 1, 1);                        -- first 10 characters
  dbms_lob.append(v_b, v_a);
  dbms_lob.trim(v_b, 20);
  dbms_lob.erase(v_b, v_amount, 3);                        -- 5 characters become spaces
  dbms_output.put_line('[' || v_b || ']');
  dbms_output.put_line('compare: ' || dbms_lob.compare(v_a, v_b));
  dbms_lob.freetemporary(v_a);
  dbms_lob.freetemporary(v_b);
end;
/
