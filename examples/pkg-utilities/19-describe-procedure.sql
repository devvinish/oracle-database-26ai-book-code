declare
  v_overload     dbms_describe.number_table;
  v_position     dbms_describe.number_table;
  v_level        dbms_describe.number_table;
  v_argument     dbms_describe.varchar2_table;
  v_datatype     dbms_describe.number_table;
  v_default      dbms_describe.number_table;
  v_in_out       dbms_describe.number_table;
  v_length       dbms_describe.number_table;
  v_precision    dbms_describe.number_table;
  v_scale        dbms_describe.number_table;
  v_radix        dbms_describe.number_table;
  v_spare        dbms_describe.number_table;
begin
  dbms_describe.describe_procedure('DBMS_LOCK.SLEEP', null, null, v_overload, v_position,
    v_level, v_argument, v_datatype, v_default, v_in_out, v_length, v_precision, v_scale,
    v_radix, v_spare);
  for i in 1 .. v_argument.count loop
    dbms_output.put_line(v_argument(i) || ': type ' || v_datatype(i)
                         || ', mode ' || v_in_out(i) || ', has default ' || v_default(i));
  end loop;
end;
/
