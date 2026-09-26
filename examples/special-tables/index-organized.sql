-- @setup drop table if exists airport_codes_iot purge
create table airport_codes_iot (
  airport_code char(3) primary key,
  city         varchar2(40)
) organization index;

insert into airport_codes_iot select airport_code, city from airports;

select table_name, iot_type from user_tables where table_name = 'AIRPORT_CODES_IOT';
select index_name, index_type from user_indexes where table_name = 'AIRPORT_CODES_IOT';
-- @cleanup drop table if exists airport_codes_iot purge
