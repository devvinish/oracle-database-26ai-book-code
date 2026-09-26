-- @setup drop table if exists crew_objects purge
-- @setup drop type if exists t_crew_member force
create type t_crew_member as object (
  employee_id number, name varchar2(60), role varchar2(20));
/
create table crew_objects of t_crew_member;

insert into crew_objects values (t_crew_member(112, 'Hugo Dubois', 'CAPTAIN'));
insert into crew_objects values (t_crew_member(133, 'Chloé Laurent', 'CABIN CREW'));

select value(c).name as name, value(c).role as role,
       length(reftohex(ref(c))) as ref_length
from   crew_objects c;

select deref(r).name as via_deref
from   (select ref(c) as r from crew_objects c where c.employee_id = 112);
-- @cleanup drop table if exists crew_objects purge
-- @cleanup drop type if exists t_crew_member force
