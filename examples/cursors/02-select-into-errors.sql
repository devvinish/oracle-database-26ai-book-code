declare
  v_city airports.city%type;
begin
  begin
    select city into v_city from airports where country_code = 'IE';
  exception
    when no_data_found then dbms_output.put_line('No airport in Ireland');
  end;
  begin
    select city into v_city from airports where country_code = 'IN';
  exception
    when too_many_rows then dbms_output.put_line('More than one airport in India');
  end;
end;
/
