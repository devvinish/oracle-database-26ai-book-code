declare
  f       utl_file.file_type;
  v_exists boolean;
  v_bytes  number;
  v_block  binary_integer;
begin
  f := utl_file.fopen('NIMBUS_FILES', 'departures.txt', 'w', max_linesize => 200);
  utl_file.put_line(f, 'Morning departures from DXB, 15-MAR-2026');
  utl_file.new_line(f);
  for r in (select flight_no, destination, to_char(scheduled_departure, 'HH24:MI') as dep
            from   flights join routes using (route_id)
            where  origin = 'DXB'
            and    cast(scheduled_departure as date)       -- local time in Dubai
                     between date '2026-03-15' and date '2026-03-15' + 0.5
            order  by scheduled_departure) loop
    utl_file.putf(f, '%s  %s  %s\n', r.dep, r.flight_no, r.destination);
  end loop;
  utl_file.fclose(f);

  utl_file.fgetattr('NIMBUS_FILES', 'departures.txt', v_exists, v_bytes, v_block);
  dbms_output.put_line('written: ' || v_bytes || ' bytes');
end;
/

select to_clob(bfilename('NIMBUS_FILES', 'departures.txt'), nls_charset_id('AL32UTF8'))
       as departures_txt;
