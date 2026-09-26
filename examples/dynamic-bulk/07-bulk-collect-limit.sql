declare
  cursor c is select ticket_id, fare from tickets order by ticket_id;
  type t_rows is table of c%rowtype;
  v_rows    t_rows;
  v_batches pls_integer := 0;
  v_total   number := 0;
begin
  open c;
  loop
    fetch c bulk collect into v_rows limit 500;          -- at most 500 rows in memory
    exit when v_rows.count = 0;
    v_batches := v_batches + 1;
    for i in 1 .. v_rows.count loop v_total := v_total + v_rows(i).fare; end loop;
  end loop;
  close c;
  dbms_output.put_line(v_batches || ' batches, total fares ' || v_total);
end;
/
