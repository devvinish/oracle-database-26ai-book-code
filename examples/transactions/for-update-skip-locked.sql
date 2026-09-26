-- this transaction takes the first two scheduled flights of route 5 ...
select flight_id from flights
where  flight_id in (2328, 2360)
for update;

-- ... and a second worker takes the next free ones, skipping the locked rows
declare
  pragma autonomous_transaction;
  cursor c_free is
    select flight_id from flights
    where  route_id = 5 and status = 'SCHEDULED'
    order  by flight_id
    for update skip locked;
  v_flight_id flights.flight_id%type;
begin
  open c_free;
  for i in 1 .. 3 loop
    fetch c_free into v_flight_id;
    dbms_output.put_line('worker 2 took flight ' || v_flight_id);
  end loop;
  close c_free;
  rollback;
end;
/
rollback;
