begin
  dbms_transaction.read_write;
  update routes set block_minutes = block_minutes where route_id = 1;
  dbms_output.put_line('transaction ' || dbms_transaction.local_transaction_id
                       || ', step ' || dbms_transaction.step_id);
  dbms_transaction.savepoint('before_delete');
  delete from payments where payment_id = 1;
  dbms_transaction.rollback_savepoint('before_delete');
  dbms_transaction.rollback;
  dbms_output.put_line('after rollback: '
                       || nvl(dbms_transaction.local_transaction_id, 'no transaction'));
end;
/
