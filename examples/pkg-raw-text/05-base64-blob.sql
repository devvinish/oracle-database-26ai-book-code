-- the logo as a data URI, for an HTML page or an e-mail: Base64 in pieces of 3 x 16 bytes
declare
  v_logo  blob;
  v_uri   clob := 'data:image/png;base64,';
  v_piece raw(48);
  v_pos   integer := 1;
begin
  v_logo := to_blob(bfilename('NIMBUS_FILES', 'logo.png'));
  while v_pos <= dbms_lob.getlength(v_logo) loop
    v_piece := dbms_lob.substr(v_logo, 48, v_pos);
    v_uri := v_uri || replace(replace(utl_raw.cast_to_varchar2(
                        utl_encode.base64_encode(v_piece)), chr(13)), chr(10));
    v_pos := v_pos + 48;
  end loop;
  dbms_output.put_line(dbms_lob.getlength(v_logo) || ' bytes -> '
                       || dbms_lob.getlength(v_uri) || ' characters');
  dbms_output.put_line(dbms_lob.substr(v_uri, 70, 1) || '...');
end;
/
