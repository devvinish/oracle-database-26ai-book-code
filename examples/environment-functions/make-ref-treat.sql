-- @setup drop table if exists people purge
-- @setup drop type if exists t_pilot force
-- @setup drop type if exists t_person force
create type t_person as object (id number, name varchar2(60)) not final;
/
create type t_pilot under t_person (licence varchar2(12));
/
create table people of t_person (primary key (id)) object identifier is primary key;

insert into people values (t_person(1, 'Emma Williams'));
insert into people values (t_pilot(2, 'Kenji Sato', 'ATPL-40771'));

select p.name, treat(value(p) as t_pilot).licence as licence,
       case when value(p) is of (t_pilot) then 'pilot' else 'person' end as kind,
       sys_typeid(value(p)) as type_id
from   people p;

select deref(make_ref(people, 2)).name as found_by_key from dual;
-- @cleanup drop table if exists people purge
-- @cleanup drop type if exists t_pilot force
-- @cleanup drop type if exists t_person force
