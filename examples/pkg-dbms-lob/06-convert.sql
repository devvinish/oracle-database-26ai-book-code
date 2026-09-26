declare
  v_text  clob := 'Café São Paulo';
  v_bytes blob;
  v_back  clob;
  v_dest  integer := 1;
  v_src   integer := 1;
  v_lang  integer := dbms_lob.default_lang_ctx;
  v_warn  integer;
begin
  dbms_lob.createtemporary(v_bytes, true);
  dbms_lob.converttoblob(v_bytes, v_text, dbms_lob.lobmaxsize, v_dest, v_src,
                         nls_charset_id('AL32UTF8'), v_lang, v_warn);
  dbms_output.put_line(dbms_lob.getlength(v_text) || ' characters = '
                       || dbms_lob.getlength(v_bytes) || ' bytes in UTF-8');
  dbms_lob.createtemporary(v_back, true);
  v_dest := 1; v_src := 1;
  dbms_lob.converttoclob(v_back, v_bytes, dbms_lob.lobmaxsize, v_dest, v_src,
                         nls_charset_id('AL32UTF8'), v_lang, v_warn);
  dbms_output.put_line('back: ' || v_back);
end;
/
