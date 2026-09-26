<<outer>>
declare
  v_name varchar2(20) := 'outer';
begin
  declare
    v_name varchar2(20) := 'inner';
  begin
    dbms_output.put_line(v_name || ' / ' || outer.v_name);
  end;

  <<rows_loop>>
  for r in 1 .. 3 loop
    for c in 1 .. 3 loop
      exit rows_loop when r * c = 4;
      dbms_output.put_line('seat ' || r || '-' || c);
    end loop;
  end loop rows_loop;
end outer;
/
