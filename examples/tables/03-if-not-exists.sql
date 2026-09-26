-- @expect-error
create table if not exists fare_rules (rule_id number);

drop table if exists no_such_table;

create table fare_rules (rule_id number);
