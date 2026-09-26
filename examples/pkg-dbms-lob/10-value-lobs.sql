-- @expect-error
declare
  v_doc clob;
begin
  select json_serialize(json('{"flight":"NA417"}') returning clob value)
  into   v_doc from dual;
  dbms_output.put_line(v_doc || ', length ' || dbms_lob.getlength(v_doc));
  dbms_lob.writeappend(v_doc, 1, ' ');                       -- a value LOB is read-only
end;
/
