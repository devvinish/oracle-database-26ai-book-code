-- @setup drop table if exists activity_log purge
-- @setup create table activity_log (logged_at timestamp default localtimestamp, message varchar2(100))
create or replace procedure log_activity (p_message varchar2) is
  pragma autonomous_transaction;
begin
  insert into activity_log (message) values (p_message);
  commit;      -- commits only the log entry
end;
/
update employees set salary = salary * 2 where employee_id = 100;
exec log_activity('Tried to double the CEO''s salary')
rollback;

select message from activity_log;
select salary from employees where employee_id = 100;
-- @cleanup drop procedure if exists log_activity
-- @cleanup drop table if exists activity_log purge
