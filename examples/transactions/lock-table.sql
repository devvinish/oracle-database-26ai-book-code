-- @expect-error
-- @setup create table if not exists fuel_log (airport_code char(3), price number)
lock table fuel_log in exclusive mode;

declare
  pragma autonomous_transaction;
begin
  lock table fuel_log in row exclusive mode nowait;
end;
/
rollback;
-- @cleanup drop table if exists fuel_log purge
