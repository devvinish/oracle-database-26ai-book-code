declare
  v_list  dbms_utility.uncl_array;
  v_count binary_integer;
  v_back  varchar2(100);
begin
  dbms_utility.comma_to_table('DXB,LHR,"São",SIN', v_count, v_list);
  for i in 1 .. v_count loop
    dbms_output.put_line(i || ': ' || v_list(i));
  end loop;
  dbms_utility.table_to_comma(v_list, v_count, v_back);
  dbms_output.put_line('back: ' || v_back);
end;
/
