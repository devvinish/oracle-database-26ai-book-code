declare
  v_parser dbms_xmlparser.parser := dbms_xmlparser.newparser;
  v_doc    dbms_xmldom.domdocument;
  v_list   dbms_xmldom.domnodelist;
  v_elem   dbms_xmldom.domelement;
  v_new    dbms_xmldom.domnode;
  v_out    varchar2(4000);
begin
  dbms_xmlparser.parsebuffer(v_parser,
    '<crew flight="NM150"><member role="CPT">Anil Rao</member>'
    || '<member role="FO">Mei Lin</member></crew>');
  v_doc := dbms_xmlparser.getdocument(v_parser);
  dbms_xmlparser.freeparser(v_parser);

  v_list := dbms_xmldom.getelementsbytagname(v_doc, 'member');
  for i in 0 .. dbms_xmldom.getlength(v_list) - 1 loop
    v_elem := dbms_xmldom.makeelement(dbms_xmldom.item(v_list, i));
    dbms_output.put_line(dbms_xmldom.getattribute(v_elem, 'role') || ': '
      || dbms_xmldom.getnodevalue(dbms_xmldom.getfirstchild(dbms_xmldom.makenode(v_elem))));
  end loop;

  -- add a member: create the element and its text, and append them
  v_elem := dbms_xmldom.createelement(v_doc, 'member');
  dbms_xmldom.setattribute(v_elem, 'role', 'FA');
  v_new := dbms_xmldom.appendchild(dbms_xmldom.makenode(v_elem),
             dbms_xmldom.makenode(dbms_xmldom.createtextnode(v_doc, 'Sara Kim')));
  v_new := dbms_xmldom.appendchild(
             dbms_xmldom.makenode(dbms_xmldom.getdocumentelement(v_doc)),
             dbms_xmldom.makenode(v_elem));
  dbms_xmldom.writetobuffer(v_doc, v_out);
  dbms_output.put_line(v_out);
  dbms_xmldom.freedocument(v_doc);
end;
/
