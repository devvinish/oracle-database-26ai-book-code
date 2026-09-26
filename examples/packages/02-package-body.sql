create or replace package body booking_api is
  g_added pls_integer := 0;                              -- private package state

  function capacity (p_flight_id number) return number is  -- private function
    v_seats number;
  begin
    select t.seats_business + t.seats_economy into v_seats
    from   flights f join aircraft a using (tail_number)
    join   aircraft_types t using (type_code)
    where  f.flight_id = p_flight_id;
    return v_seats;
  end;

  function seats_taken (p_flight_id number) return number is
    v_taken number;
  begin
    select count(*) into v_taken from tickets where flight_id = p_flight_id;
    return v_taken;
  end;

  procedure add_ticket (p_booking_id number, p_flight_id number, p_seat varchar2,
                        p_fare number, p_cabin varchar2 default 'ECONOMY') is
  begin
    if seats_taken(p_flight_id) >= capacity(p_flight_id) then
      raise e_flight_full;
    end if;
    insert into tickets (booking_id, flight_id, cabin, seat_no, fare)
    values (p_booking_id, p_flight_id, p_cabin, p_seat, p_fare);
    g_added := g_added + 1;
  end;

  function tickets_added return pls_integer is
  begin
    return g_added;
  end;
begin
  dbms_output.put_line('booking_api initialized');       -- runs once per session
end booking_api;
/
