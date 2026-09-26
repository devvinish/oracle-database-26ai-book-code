-- @expect-error
-- @setup drop table if exists amounts purge
create table amounts (price number(7,2), rounded number(5,-2), anything number);
insert into amounts values (1234.567, 12345.67, 1/3);
select * from amounts;

insert into amounts (price) values (123456.78);
-- @cleanup drop table if exists amounts purge
