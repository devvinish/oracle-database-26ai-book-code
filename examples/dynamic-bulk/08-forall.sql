declare
  type t_ids   is table of number;
  v_ids   t_ids;
  v_fares t_ids := t_ids();
begin
  select route_id bulk collect into v_ids from routes where origin = 'DXB';
  v_fares.extend(v_ids.count);
  for i in 1 .. v_ids.count loop
    v_fares(i) := 100 + i;          -- FORALL can only subscript collections: prepare values
  end loop;

  forall i in 1 .. v_ids.count
    insert into fare_snapshot (route_id, fare) values (v_ids(i), v_fares(i));
  dbms_output.put_line(sql%rowcount || ' rows inserted in one call');

  forall i in 1 .. 3
    update fare_snapshot set fare = fare * 2 where route_id = v_ids(i);
  for i in 1 .. 3 loop
    dbms_output.put_line('route ' || v_ids(i) || ': '
                         || sql%bulk_rowcount(i) || ' updated');
  end loop;
  rollback;
end;
/
