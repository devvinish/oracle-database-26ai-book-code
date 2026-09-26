declare
  v_report clob;
begin
  select listagg(airport_code || ',' || city, chr(10)) within group (order by airport_code)
  into   v_report
  from   airports where country_code = 'IN';
  dbms_lob.clob2file(v_report, 'NIMBUS_FILES', 'indian_airports.csv');
end;
/
select dbms_lob.getlength(bfilename('NIMBUS_FILES',
                          'indian_airports.csv')) as bytes_written;
