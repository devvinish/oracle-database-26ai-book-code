-- @expect-error
update aircraft set status = 'MAINTENANCE' where tail_number = 'A6-NAD';

declare
  pragma autonomous_transaction;
begin
  -- waits for the row this session's main transaction holds: a deadlock
  update aircraft set status = 'RETIRED' where tail_number = 'A6-NAD';
end;
/
rollback;
