-- @setup drop table if exists codes purge
create table codes (c char(5), v varchar2(5));
insert into codes values ('NM', 'NM');

select '[' || c || ']' as char_value, '[' || v || ']' as varchar2_value,
       length(c) as char_len, length(v) as varchar2_len
from   codes;

select count(*) as matches from codes where c = v;
select count(*) as matches from codes where c = 'NM';
-- @cleanup drop table if exists codes purge
