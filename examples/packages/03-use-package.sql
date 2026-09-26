begin
  booking_api.add_ticket(1, 2800, '44C', 299);
  booking_api.add_ticket(1, 2801, '44D', 299);
  dbms_output.put_line('Added this session: ' || booking_api.tickets_added
                       || ' (' || booking_api.c_currency || ')');
  dbms_output.put_line('Seats taken on 2800: ' || booking_api.seats_taken(2800));
  rollback;
end;
/
