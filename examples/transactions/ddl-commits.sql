-- @setup drop table if exists scratch purge
update aircraft set status = 'RETIRED' where tail_number = 'A6-NAB';
create table scratch (n number);          -- DDL commits the open transaction first
rollback;
select tail_number, status from aircraft where tail_number = 'A6-NAB';
-- @cleanup update aircraft set status = 'ACTIVE' where tail_number = 'A6-NAB'
-- @cleanup commit
-- @cleanup drop table if exists scratch purge
