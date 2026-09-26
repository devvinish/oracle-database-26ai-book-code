select ctx_doc.snippet('TRAVEL_NOTES_CTX', '3', 'lounge') as snippet from dual;

declare
  v_marked clob;
begin
  ctx_doc.markup(index_name => 'TRAVEL_NOTES_CTX', textkey => '1',
                 text_query => 'Dubai | Gold', restab => v_marked,
                 plaintext  => true, starttag => '[', endtag => ']');
  dbms_output.put_line(v_marked);
end;
/
