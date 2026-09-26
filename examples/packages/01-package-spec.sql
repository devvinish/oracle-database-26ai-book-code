create or replace package booking_api is
  c_currency constant char(3) := 'USD';
  e_flight_full exception;

  function seats_taken (p_flight_id number) return number;
  procedure add_ticket (p_booking_id number, p_flight_id number, p_seat varchar2,
                        p_fare number, p_cabin varchar2 default 'ECONOMY');
  function tickets_added return pls_integer;
end booking_api;
/
