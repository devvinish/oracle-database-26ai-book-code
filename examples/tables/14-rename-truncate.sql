-- @setup drop table if exists fare_rules_2026 purge
-- @setup drop table if exists fare_rules_copy purge
-- @setup create table fare_rules_copy as select * from fare_rules
rename fare_rules_copy to fare_rules_2026;

truncate table fare_rules_2026;
select count(*) as rows_left from fare_rules_2026;
-- @cleanup drop table if exists fare_rules_2026 purge
