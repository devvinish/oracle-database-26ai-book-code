declare
  a varchar2(128); b varchar2(128); c varchar2(128); dblink varchar2(128);
  v_next binary_integer;
  v_schema varchar2(128); v_part1 varchar2(128); v_part2 varchar2(128);
  v_type number; v_objno number;
begin
  dbms_utility.name_tokenize('nimbus."Booking API".add_ticket@loopback', a, b, c, dblink,
                             v_next);
  dbms_output.put_line('tokens: ' || a || ' | ' || b || ' | ' || c || ' | ' || dblink);

  dbms_utility.name_resolve('flights', 2, v_schema, v_part1, v_part2, dblink, v_type,
                            v_objno);
  dbms_output.put_line('resolved: ' || v_schema || '.' || v_part1 || ' (type '
                       || v_type || ')');

  dbms_utility.canonicalize('nimbus."Flights"', v_part1, 100);
  dbms_output.put_line('canonical: ' || v_part1);
end;
/
