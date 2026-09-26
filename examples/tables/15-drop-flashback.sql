-- @setup drop table if exists old_fares purge
-- @setup purge recyclebin
create table old_fares as select * from fare_rules;
drop table old_fares;

select original_name, operation, type from user_recyclebin;

flashback table old_fares to before drop;
select count(*) as restored_rows from old_fares;

drop table old_fares purge;
select count(*) as in_recyclebin from user_recyclebin where original_name = 'OLD_FARES';
