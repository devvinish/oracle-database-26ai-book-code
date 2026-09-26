-- @setup create or replace type t_code_list as table of varchar2(3)
declare
  v_codes t_code_list := t_code_list('SIN', 'NRT', 'KTM');
begin
  for r in (select a.airport_code, a.city
            from   airports a
            join   table(v_codes) c on c.column_value = a.airport_code
            order  by a.airport_code) loop
    dbms_output.put_line(r.airport_code || ' ' || r.city);
  end loop;
end;
/
