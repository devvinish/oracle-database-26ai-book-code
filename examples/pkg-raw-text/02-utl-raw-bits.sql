declare
  -- one bit per service: 01 = meal, 02 = Wi-Fi, 04 = lounge, 08 = priority boarding
  v_business raw(1) := hextoraw('0F');
  v_economy  raw(1) := hextoraw('03');
  v_wifi     raw(1) := hextoraw('02');
  procedure show (p_label varchar2, p_value varchar2) is
  begin
    dbms_output.put_line(rpad(p_label, 21) || p_value);
  end;
begin
  show('economy has Wi-Fi?', case when utl_raw.bit_and(v_economy, v_wifi) = v_wifi
                                   then 'yes' end);
  show('business only:', rawtohex(utl_raw.bit_xor(v_business, v_economy)));
  show('either cabin:', rawtohex(utl_raw.bit_or(v_business, v_economy)));
  show('not in economy:', rawtohex(utl_raw.bit_complement(v_economy)));
  show('1000, big-endian:', rawtohex(utl_raw.cast_from_binary_integer(1000)));
  show('1000, little-endian:',
       rawtohex(utl_raw.cast_from_binary_integer(1000, utl_raw.little_endian)));
  show('and back:', utl_raw.cast_to_binary_integer(hextoraw('000003E8')));
  show('NUMBER 2.5 inside:', rawtohex(utl_raw.cast_from_number(2.5)));
end;
/
