declare
  f      utl_file.file_type;
  v_line varchar2(200);
  v_n    pls_integer := 0;
  v_sum  number := 0;
begin
  f := utl_file.fopen('NIMBUS_FILES', 'fuel_prices.csv', 'r');
  utl_file.get_line(f, v_line);                            -- skip the header
  loop
    begin
      utl_file.get_line(f, v_line);
    exception
      when no_data_found then exit;                        -- end of file
    end;
    if v_line like 'DXB,%' then
      v_n := v_n + 1;
      v_sum := v_sum + to_number(regexp_substr(v_line, '[^,]+', 1, 3));
    end if;
  end loop;
  utl_file.fclose(f);
  dbms_output.put_line('DXB: ' || v_n || ' prices, average '
                       || to_char(v_sum / v_n, 'FM0.00') || ' USD per gallon');
end;
/
