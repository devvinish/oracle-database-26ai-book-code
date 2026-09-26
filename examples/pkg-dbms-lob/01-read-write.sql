declare
  v_doc   clob;
  v_part  varchar2(100);
  v_amt   integer := 20;
begin
  dbms_lob.createtemporary(v_doc, cache => true);
  dbms_lob.write(v_doc, 13, 1, 'Nimbus Air - ');
  dbms_lob.writeappend(v_doc, 29, 'baggage policy, version 2026.');
  dbms_output.put_line('length: ' || dbms_lob.getlength(v_doc));
  dbms_lob.read(v_doc, v_amt, 14, v_part);
  dbms_output.put_line('read ' || v_amt || ' chars from 14: ' || v_part);
  dbms_output.put_line('substr: ' || dbms_lob.substr(v_doc, 6, 1));
  dbms_output.put_line('instr of "version": ' || dbms_lob.instr(v_doc, 'version'));
  dbms_output.put_line('temporary? ' || dbms_lob.istemporary(v_doc));
  dbms_lob.freetemporary(v_doc);
end;
/
