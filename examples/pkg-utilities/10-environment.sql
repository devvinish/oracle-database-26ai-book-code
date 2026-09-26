declare
  v_version     varchar2(40);
  v_compatible  varchar2(40);
begin
  dbms_utility.db_version(v_version, v_compatible);
  dbms_output.put_line('version ' || v_version || ', compatible ' || v_compatible);
  dbms_output.put_line('platform: ' || dbms_utility.port_string);
  dbms_output.put_line('endianness: ' || dbms_utility.get_endianness);
  dbms_output.put_line('cluster? '
    || case when dbms_utility.is_cluster_database then 'yes' else 'no' end
    || ', instance ' || dbms_utility.current_instance);
  dbms_output.put_line('hash of DXB: ' || dbms_utility.get_hash_value('DXB', 1, 1000));
end;
/
