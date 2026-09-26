-- @expect-error
-- @setup drop table if exists city_names purge
create table city_names (in_bytes varchar2(9 byte), in_chars varchar2(9 char));
insert into city_names (in_chars) values ('São Paulo');
insert into city_names (in_bytes) values ('São Paulo');
-- @cleanup drop table if exists city_names purge
