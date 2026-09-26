declare
  v_raw raw(100) := utl_raw.cast_to_raw('NIMBUS');
  procedure show (p_label varchar2, p_value varchar2) is
  begin
    dbms_output.put_line(rpad(p_label, 10) || p_value);
  end;
begin
  show('bytes:', rawtohex(v_raw) || ' (' || utl_raw.length(v_raw) || ')');
  show('text:', utl_raw.cast_to_varchar2(v_raw));
  show('substr:', utl_raw.cast_to_varchar2(utl_raw.substr(v_raw, 2, 3)));
  show('reverse:', utl_raw.cast_to_varchar2(utl_raw.reverse(v_raw)));
  show('concat:', utl_raw.cast_to_varchar2(
                    utl_raw.concat(v_raw, utl_raw.cast_to_raw(' AIR'))));
  show('overlay:', utl_raw.cast_to_varchar2(
                    utl_raw.overlay(utl_raw.cast_to_raw('**'), v_raw, 3)));
  show('copies:', rawtohex(utl_raw.copies('00FF', 3)));
  show('xrange:', rawtohex(utl_raw.xrange('41', '46')));
  show('compare:', utl_raw.compare(v_raw, utl_raw.cast_to_raw('NIMBLE')));
end;
/
