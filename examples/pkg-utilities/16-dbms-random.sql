begin
  dbms_random.seed(2026);                                       -- repeatable sequence
  dbms_output.put_line('value:    ' || round(dbms_random.value, 6));
  dbms_output.put_line('1 to 100: ' || trunc(dbms_random.value(1, 101)));
  dbms_output.put_line('normal:   ' || round(dbms_random.normal, 4));
  dbms_output.put_line('upper:    ' || dbms_random.string('U', 6));
  dbms_output.put_line('mixed:    ' || dbms_random.string('X', 8));
  dbms_output.put_line('any:      ' || dbms_random.string('p', 10));
end;
/
select airport_code from airports order by dbms_random.value fetch first 3 rows only;
