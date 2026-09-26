declare
  v_packed blob;
  v_h      binary_integer;
begin
  dbms_lob.createtemporary(v_packed, true);
  v_h := utl_compress.lz_compress_open(v_packed, quality => 9);
  for r in (select airport_code || ',' || city || chr(10) as line
            from airports order by 1) loop
    utl_compress.lz_compress_add(v_h, v_packed, utl_raw.cast_to_raw(r.line));
  end loop;
  utl_compress.lz_compress_close(v_h, v_packed);
  dbms_output.put_line('22 airports in ' || dbms_lob.getlength(v_packed) || ' bytes');
  dbms_output.put_line(utl_raw.cast_to_varchar2(
                         dbms_lob.substr(utl_compress.lz_uncompress(v_packed), 30, 1)));
end;
/
