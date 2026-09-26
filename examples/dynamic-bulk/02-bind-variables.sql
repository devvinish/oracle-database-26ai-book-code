declare
  v_sql     varchar2(200) :=
    'select count(*) from flights where route_id = :r and status = :s';
  v_count   number;
begin
  execute immediate v_sql into v_count using 1, 'CANCELLED';
  dbms_output.put_line('Route 1 cancelled: ' || v_count);
  execute immediate v_sql into v_count using 2, 'ARRIVED';
  dbms_output.put_line('Route 2 arrived: ' || v_count);
end;
/
