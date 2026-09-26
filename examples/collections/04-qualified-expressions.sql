declare
  type t_fares is table of number index by varchar2(8);
  type t_seats is table of varchar2(4) index by pls_integer;
  v_fares t_fares := t_fares('BUSINESS' => 2290, 'ECONOMY' => 641);
  v_seats t_seats := t_seats(1 => '1A', 2 => '1C', 10 => '12F');
  v_even  t_seats := t_seats(for i in 1 .. 6 when mod(i, 2) = 0 index i => i || 'A');
begin
  dbms_output.put_line('Business fare ' || v_fares('BUSINESS'));
  dbms_output.put_line('Seats ' || v_seats.count || ', first ' || v_seats(v_seats.first)
                       || ', last ' || v_seats(v_seats.last));
  dbms_output.put_line('Even rows: ' || v_even(2) || ' ' || v_even(4) || ' ' || v_even(6));
end;
/
