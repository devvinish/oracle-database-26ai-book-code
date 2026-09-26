declare
  ctx   dbms_xmlgen.ctxhandle;
  v_xml clob;
begin
  ctx := dbms_xmlgen.newcontext('select airport_code as "code", city as "city", is_hub
                                 from airports where country_code = ''IN'' order by 1');
  dbms_xmlgen.setrowsettag(ctx, 'airports');
  dbms_xmlgen.setrowtag(ctx, 'airport');
  dbms_xmlgen.setnullhandling(ctx, dbms_xmlgen.empty_tag);
  dbms_xmlgen.setmaxrows(ctx, 2);
  v_xml := dbms_xmlgen.getxml(ctx);
  dbms_output.put_line(v_xml);
  dbms_output.put_line('rows: ' || dbms_xmlgen.getnumrowsprocessed(ctx));
  dbms_xmlgen.closecontext(ctx);
end;
/
