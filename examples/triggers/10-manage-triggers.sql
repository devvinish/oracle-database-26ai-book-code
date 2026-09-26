alter trigger employees_salary_trg disable;
alter table customers disable all triggers;

select trigger_name, trigger_type, triggering_event, status
from   user_triggers
order  by trigger_name;

alter table customers enable all triggers;
drop trigger employees_salary_trg;
drop trigger customers_normalize_trg;
-- @cleanup drop table if exists salary_history purge
