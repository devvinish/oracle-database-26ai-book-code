declare
  v_rindex binary_integer := dbms_application_info.set_session_longops_nohint;
  v_slno   binary_integer;
begin
  for i in 1 .. 4 loop
    dbms_application_info.set_session_longops(
      rindex => v_rindex, slno => v_slno, op_name => 'Repricing routes',
      sofar => i * 25, totalwork => 100, units => 'percent');
  end loop;
end;
/
select opname, sofar, totalwork, units from v$session_longops
where  sid = sys_context('USERENV', 'SID') and opname = 'Repricing routes';
