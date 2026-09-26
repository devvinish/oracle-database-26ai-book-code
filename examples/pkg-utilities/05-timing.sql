declare
  v_elapsed pls_integer := dbms_utility.get_time;       -- hundredths of a second
  v_cpu     pls_integer := dbms_utility.get_cpu_time;
  v_n       number := 0;
begin
  for i in 1 .. 2000000 loop v_n := v_n + sqrt(i); end loop;
  dbms_output.put_line('elapsed: ' || (dbms_utility.get_time - v_elapsed) || ' cs, cpu: '
                       || (dbms_utility.get_cpu_time - v_cpu) || ' cs');
end;
/
