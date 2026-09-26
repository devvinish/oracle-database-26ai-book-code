declare
  v_new_id number;
begin
  execute immediate
    'insert into fare_snapshot (route_id, fare) values (:1, :2) returning route_id into :3'
    using 7, 450 returning into v_new_id;
  dbms_output.put_line('Inserted route ' || v_new_id || ', ' || sql%rowcount || ' row');
  rollback;
end;
/
