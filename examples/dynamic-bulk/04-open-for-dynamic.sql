declare
  c        sys_refcursor;
  v_table  varchar2(30) := 'AIRPORTS';
  v_code   varchar2(3);
  v_name   varchar2(80);
begin
  open c for 'select airport_code, city from ' || dbms_assert.sql_object_name(v_table)
             || ' where country_code = :c order by 1' using 'US';
  loop
    fetch c into v_code, v_name;
    exit when c%notfound;
    dbms_output.put_line(v_code || ' ' || v_name);
  end loop;
  close c;
end;
/
