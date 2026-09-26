declare
  type t_numbers is table of number index by pls_integer;
  v_routes t_numbers;
  v_fares  t_numbers;
begin
  v_routes(1) := 1;  v_fares(1) := 100;              -- a sparse collection: indexes 1, 5, 9
  v_routes(5) := 5;  v_fares(5) := 500;
  v_routes(9) := 9;  v_fares(9) := 900;
  forall i in indices of v_fares
    insert into fare_snapshot values (v_routes(i), v_fares(i));
  dbms_output.put_line(sql%rowcount || ' rows from a sparse collection');
  rollback;
end;
/
-- @cleanup drop table if exists fare_snapshot purge
