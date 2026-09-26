declare
  c_tax_rate    constant number(3,2) := 0.05;
  v_fare        tickets.fare%type;              -- the type of a column
  v_ticket      tickets%rowtype;                -- a record like a row
  v_count       pls_integer := 0;
  v_hub         boolean default true;
  v_route_name  varchar2(20) not null := 'DXB-LHR';
begin
  select * into v_ticket from tickets where ticket_id = 1;
  v_fare := v_ticket.fare;
  dbms_output.put_line('Ticket ' || v_ticket.ticket_id || ' in ' || v_ticket.cabin
                       || ': fare ' || v_fare
                       || ', with tax ' || round(v_fare * (1 + c_tax_rate), 2));
  dbms_output.put_line('Hub? ' || case when v_hub then 'yes' else 'no' end
                       || ', route ' || v_route_name);
end;
/
