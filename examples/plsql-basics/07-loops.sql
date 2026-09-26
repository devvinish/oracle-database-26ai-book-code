declare
  i pls_integer := 0;
begin
  loop                                          -- basic loop
    i := i + 1;
    exit when i > 3;
    dbms_output.put_line('basic loop ' || i);
  end loop;

  while i > 1 loop                              -- WHILE loop
    i := i - 1;
    continue when mod(i, 2) = 0;
    dbms_output.put_line('while loop ' || i);
  end loop;

  for j in reverse 1 .. 3 loop                  -- numeric FOR loop
    dbms_output.put_line('for loop ' || j);
  end loop;
end;
/
