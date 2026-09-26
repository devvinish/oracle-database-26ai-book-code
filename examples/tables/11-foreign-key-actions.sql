-- @setup drop table if exists rule_notes purge
create table rule_notes (
  note_id  number primary key,
  rule_id  number constraint rule_notes_rule_fk references fare_rules on delete cascade,
  note     varchar2(100)
);
insert into rule_notes values (1, 1, 'Winter promotion'), (2, 1, 'Excludes holidays');

delete from fare_rules where rule_id = 1;
select count(*) as notes_left from rule_notes;
rollback;
-- @cleanup drop table if exists rule_notes purge
