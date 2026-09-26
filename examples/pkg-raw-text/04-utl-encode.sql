declare
  v_text varchar2(100) := 'Boarding pass NM150, seat 12A';
  v_b64  varchar2(200);
begin
  v_b64 := utl_raw.cast_to_varchar2(utl_encode.base64_encode(utl_raw.cast_to_raw(v_text)));
  dbms_output.put_line('Base64:  ' || v_b64);
  dbms_output.put_line('decoded: ' || utl_raw.cast_to_varchar2(
                         utl_encode.base64_decode(utl_raw.cast_to_raw(v_b64))));
  dbms_output.put_line('text_encode: ' || utl_encode.text_encode('Café crème', 'AL32UTF8',
                                                                  utl_encode.base64));
  dbms_output.put_line('quoted-printable: ' || utl_raw.cast_to_varchar2(
                         utl_encode.quoted_printable_encode(
                           utl_i18n.string_to_raw('Café = 5€', 'AL32UTF8'))));
end;
/
