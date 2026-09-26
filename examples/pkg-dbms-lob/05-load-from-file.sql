declare
  v_file     bfile := bfilename('NIMBUS_FILES', 'welcome.txt');
  v_image    bfile := bfilename('NIMBUS_FILES', 'logo.png');
  v_text     clob;
  v_logo     blob;
  v_dest     integer := 1;
  v_src      integer := 1;
  v_lang     integer := dbms_lob.default_lang_ctx;
  v_warning  integer;
begin
  update policies set body = empty_clob() where id = 1 returning body into v_text;
  dbms_lob.fileopen(v_file);
  dbms_lob.loadclobfromfile(v_text, v_file, dbms_lob.lobmaxsize, v_dest, v_src,
                            nls_charset_id('AL32UTF8'), v_lang, v_warning);
  dbms_lob.fileclose(v_file);
  dbms_output.put_line('text loaded: ' || dbms_lob.getlength(v_text) || ' characters');

  dbms_lob.createtemporary(v_logo, true);
  v_dest := 1; v_src := 1;
  dbms_lob.fileopen(v_image);
  dbms_lob.loadblobfromfile(v_logo, v_image, dbms_lob.lobmaxsize, v_dest, v_src);
  dbms_lob.fileclose(v_image);
  dbms_output.put_line('image loaded: ' || dbms_lob.getlength(v_logo) || ' bytes, starts '
                       || rawtohex(dbms_lob.substr(v_logo, 4, 1)));
  rollback;
end;
/
