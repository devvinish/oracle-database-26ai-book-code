declare
  v_data raw(100) := utl_i18n.string_to_raw('NM150|DXB|LHR|2026-03-15', 'AL32UTF8');
  v_key  raw(32)  := utl_raw.cast_to_raw('nimbus-secret test-key');     -- a test key
begin
  dbms_output.put_line('SHA-256:  ' || dbms_crypto.hash(v_data, dbms_crypto.hash_sh256));
  dbms_output.put_line('SHA3-256: ' || dbms_crypto.hash(v_data, dbms_crypto.hash_sha3_256));
  dbms_output.put_line('HMAC:     '
                       || dbms_crypto.mac(v_data, dbms_crypto.hmac_sh256, v_key));
end;
/
select standard_hash('NM150|DXB|LHR|2026-03-15', 'SHA256') as same_in_sql from dual;
