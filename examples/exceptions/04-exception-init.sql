-- @expect-error
declare
  e_child_rows exception;
  pragma exception_init(e_child_rows, -2292);
begin
  delete from routes where route_id = 1;
exception
  when e_child_rows then
    dbms_output.put_line('Route 1 still has flights: ' || sqlerrm);
end;
/
