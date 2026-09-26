-- @expect-error
-- this transaction locks a row ...
select tail_number, status from aircraft where tail_number = 'A6-NAC' for update;

-- ... and another transaction (an autonomous one) tries to lock it too
declare
  pragma autonomous_transaction;
  v_status aircraft.status%type;
begin
  select status into v_status from aircraft where tail_number = 'A6-NAC' for update nowait;
end;
/
rollback;
