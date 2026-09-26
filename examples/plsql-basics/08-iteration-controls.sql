declare
  type t_codes is table of varchar2(3);
  v_codes t_codes := t_codes('DXB', 'LHR', 'SIN');
begin
  for i in 1 .. 10 by 3 loop
    dbms_output.put_line('stepped: ' || i);
  end loop;
  for i in 1 .. 2, 8 .. 9 loop
    dbms_output.put_line('ranges: ' || i);
  end loop;
  for code in values of v_codes loop
    dbms_output.put_line('value: ' || code);
  end loop;
  for i, code in pairs of v_codes loop
    dbms_output.put_line('pair: ' || i || ' = ' || code);
  end loop;
end;
/
