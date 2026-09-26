-- @expect-error
declare
  v_key raw(32) := hextoraw('000102030405060708090A0B0C0D0E0F'
                            || '101112131415161718191A1B1C1D1E1F');
  v_iv  raw(12) := hextoraw('B0B1B2B3B4B5B6B7B8B9BABB');
  v_aad raw(20) := utl_raw.cast_to_raw('booking NX7Q2P');     -- authenticated, not secret
  v_tag raw(16);
  v_enc raw(200);
begin
  v_enc := dbms_crypto.encrypt(utl_raw.cast_to_raw('Seat 12A'), dbms_crypto.aes_gcm_none,
                               v_key, v_iv, v_aad, v_tag);
  dbms_output.put_line('encrypted ' || v_enc || ', tag ' || v_tag);
  dbms_output.put_line('decrypted: ' || utl_raw.cast_to_varchar2(
    dbms_crypto.decrypt(v_enc, dbms_crypto.aes_gcm_none, v_key, v_iv, v_aad, v_tag)));
  -- change one byte of the ciphertext: the tag no longer matches
  v_enc := utl_raw.bit_xor(v_enc, hextoraw('0100000000000000'));
  dbms_output.put_line(utl_raw.cast_to_varchar2(
    dbms_crypto.decrypt(v_enc, dbms_crypto.aes_gcm_none, v_key, v_iv, v_aad, v_tag)));
exception
  when others then dbms_output.put_line('tampered: ' || sqlerrm);
end;
/
