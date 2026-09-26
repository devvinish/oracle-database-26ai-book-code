-- @setup drop table if exists flags purge
create table flags (name varchar2(20), active boolean);
insert into flags values ('upgrade offer', true), ('wifi promo', false),
                         ('unknown', null), ('from text', 'yes'), ('from number', 0);

select name, active, not active as negated,
       case when active then 'on' when not active then 'off' else '?' end as state
from   flags;

select count(*) as active_flags from flags where active;
-- @cleanup drop table if exists flags purge
