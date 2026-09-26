declare
  v_utf8   raw(100) := utl_i18n.string_to_raw('Zürich', 'AL32UTF8');
  v_latin1 raw(100);
begin
  v_latin1 := utl_raw.convert(v_utf8, 'AMERICAN_AMERICA.WE8ISO8859P1',
                              'AMERICAN_AMERICA.AL32UTF8');
  dbms_output.put_line('UTF-8:   ' || rawtohex(v_utf8));
  dbms_output.put_line('Latin-1: ' || rawtohex(v_latin1));
  dbms_output.put_line('back:    ' || utl_i18n.raw_to_char(v_latin1, 'WE8ISO8859P1'));
  dbms_output.put_line('translate: ' || utl_raw.cast_to_varchar2(
                         utl_raw.translate(utl_raw.cast_to_raw('A6-NAB'), '2D', '5F')));
end;
/
