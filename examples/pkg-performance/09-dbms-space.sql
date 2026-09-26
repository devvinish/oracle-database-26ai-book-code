declare
  v_unf  number; v_unf_b  number; v_fs1 number; v_fs1_b number; v_fs2 number;
  v_fs2_b number; v_fs3 number; v_fs3_b number; v_fs4 number; v_fs4_b number;
  v_full number; v_full_b number; v_used number; v_alloc number;
begin
  dbms_space.space_usage(user, 'FLIGHTS', 'TABLE', v_unf, v_unf_b, v_fs1, v_fs1_b, v_fs2,
                         v_fs2_b, v_fs3, v_fs3_b, v_fs4, v_fs4_b, v_full, v_full_b);
  dbms_output.put_line('FLIGHTS: ' || v_full || ' full blocks, '
                       || (v_fs1 + v_fs2 + v_fs3 + v_fs4) || ' with free space');
  -- what would a table of 10 million 120-byte rows need?
  dbms_space.create_table_cost('USERS', 120, 10000000, 10, v_used, v_alloc);
  dbms_output.put_line('10 million rows: ' || round(v_used / 1024 / 1024)
                       || ' MB used, ' || round(v_alloc / 1024 / 1024) || ' MB allocated');
end;
/
