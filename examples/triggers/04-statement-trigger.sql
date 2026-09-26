-- @expect-error
create or replace trigger payments_no_delete_trg
  before delete on payments                     -- a statement trigger: no FOR EACH ROW
begin
  raise_application_error(-20100, 'Payments can''t be deleted, only refunded');
end;
/
delete from payments where payment_id = 1;
-- @cleanup drop trigger if exists payments_no_delete_trg
