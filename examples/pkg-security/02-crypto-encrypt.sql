declare
  -- AES with a 256-bit key, CBC chaining, and PKCS#5 padding
  c_type constant pls_integer := dbms_crypto.encrypt_aes256 + dbms_crypto.chain_cbc
                                 + dbms_crypto.pad_pkcs5;
  -- fixed test values; use dbms_crypto.randombytes(32) and (16), and keep the key safe
  v_key  raw(32) := hextoraw('000102030405060708090A0B0C0D0E0F'
                             || '101112131415161718191A1B1C1D1E1F');
  v_iv   raw(16) := hextoraw('A0A1A2A3A4A5A6A7A8A9AAABACADAEAF');
  v_enc  raw(200);
begin
  v_enc := dbms_crypto.encrypt(utl_i18n.string_to_raw('Passport X1234567', 'AL32UTF8'),
                               c_type, v_key, v_iv);
  dbms_output.put_line('encrypted: ' || v_enc);
  dbms_output.put_line('decrypted: ' || utl_i18n.raw_to_char(
                         dbms_crypto.decrypt(v_enc, c_type, v_key, v_iv), 'AL32UTF8'));
end;
/
