begin
  update employees set salary = salary * 1.02 where department_id = 90;
  dbms_output.put_line(sql%rowcount || ' rows updated');

  delete from payments where booking_id = -1;
  if sql%notfound then
    dbms_output.put_line('No payment deleted');
  end if;
  rollback;
end;
/
