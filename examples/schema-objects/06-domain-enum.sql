-- @setup drop domain if exists cabin_d force
create domain cabin_d as enum (business = 'B', premium = 'P', economy = 'E');

select * from cabin_d;
select cabin_d.business as code from dual;
-- @cleanup drop domain if exists cabin_d force
