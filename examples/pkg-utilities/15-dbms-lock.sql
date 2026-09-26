declare
  v_handle varchar2(128);
  v_result integer;
begin
  dbms_lock.allocate_unique('NIMBUS_NIGHTLY_REPRICING', v_handle);
  v_result := dbms_lock.request(v_handle, dbms_lock.x_mode, timeout => 0,
                                release_on_commit => false);
  dbms_output.put_line('request: ' || v_result || ' (0 = success)');
  v_result := dbms_lock.request(v_handle, dbms_lock.x_mode, timeout => 0);
  dbms_output.put_line('again:   ' || v_result || ' (4 = already own it)');
  v_result := dbms_lock.release(v_handle);
  dbms_output.put_line('release: ' || v_result);
end;
/
