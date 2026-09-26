-- @expect-error
declare
  type t_numbers is table of number;
  v_routes t_numbers := t_numbers(1, 2, 3, 4);
  v_fares  t_numbers := t_numbers(120, -5, 300, -1);
  e_bulk   exception;
  pragma exception_init(e_bulk, -24381);
begin
  execute immediate
    'alter table fare_snapshot add constraint fare_snapshot_ck check (fare > 0)';
  forall i in 1 .. v_fares.count save exceptions
    insert into fare_snapshot values (v_routes(i), v_fares(i));
exception
  when e_bulk then
    dbms_output.put_line(sql%rowcount || ' rows inserted, '
                         || sql%bulk_exceptions.count || ' failed');
    for j in 1 .. sql%bulk_exceptions.count loop
      dbms_output.put_line('row ' || sql%bulk_exceptions(j).error_index || ': '
                           || sqlerrm(-sql%bulk_exceptions(j).error_code));
    end loop;
    rollback;
end;
/
