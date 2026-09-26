declare
  v_text   clob;
  v_raw    blob;
  v_packed blob;
  v_back   blob;
  d integer := 1; s integer := 1; l integer := dbms_lob.default_lang_ctx; w integer;
begin
  select listagg(flight_no || ' ' || status, ', ') within group (order by flight_id)
  into   v_text
  from   flights where scheduled_departure < timestamp '2026-01-05 00:00:00 UTC';
  dbms_lob.createtemporary(v_raw, true);
  dbms_lob.converttoblob(v_raw, v_text, dbms_lob.lobmaxsize, d, s, 0, l, w);
  v_packed := utl_compress.lz_compress(v_raw);
  v_back   := utl_compress.lz_uncompress(v_packed);
  dbms_output.put_line('original ' || dbms_lob.getlength(v_raw) || ' bytes, compressed '
                       || dbms_lob.getlength(v_packed) || ', uncompressed '
                       || dbms_lob.getlength(v_back));
  dbms_output.put_line('same? ' || dbms_lob.compare(v_raw, v_back)
                       || ', gzip header ' || rawtohex(dbms_lob.substr(v_packed, 2, 1)));
end;
/
