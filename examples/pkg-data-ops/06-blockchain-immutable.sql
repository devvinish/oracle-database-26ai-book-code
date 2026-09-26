-- @setup drop table if exists payment_ledger purge
create blockchain table payment_ledger (
  payment_id number,
  amount     number(10,2)
) no drop until 0 days idle
  no delete until 16 days after insert
  hashing using "SHA2_512" version "v2";

insert into payment_ledger select payment_id, amount from payments where payment_id <= 50;
commit;

declare
  v_verified number;
  v_deleted  number;
begin
  -- recompute the hashes of all rows and compare them with the stored chain
  dbms_blockchain_table.verify_rows(user, 'PAYMENT_LEDGER',
                                    number_of_rows_verified => v_verified);
  dbms_output.put_line(v_verified || ' rows verified');
  -- rows can only be deleted once their retention period has passed
  dbms_blockchain_table.delete_expired_rows(user, 'PAYMENT_LEDGER',
                                            number_of_rows_deleted => v_deleted);
  dbms_output.put_line(v_deleted || ' rows deleted: none has expired yet');
end;
/
-- @cleanup drop table if exists payment_ledger purge
