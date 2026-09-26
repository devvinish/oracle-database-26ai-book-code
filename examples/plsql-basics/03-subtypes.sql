-- @expect-error
declare
  subtype t_airport is char(3);
  subtype t_percent is pls_integer range 0 .. 100;     -- RANGE: for PLS_INTEGER subtypes
  v_origin  t_airport := 'DXB';
  v_load    t_percent;
begin
  v_load := 87;
  dbms_output.put_line(v_origin || ' load factor ' || v_load || '%');
  v_load := 120;
end;
/
