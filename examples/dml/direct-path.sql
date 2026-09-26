-- @setup drop table if exists flight_archive purge
-- @setup create table flight_archive as select * from flights where 1 = 0
insert /*+ append */ into flight_archive select * from flights where status = 'CANCELLED';

select count(*) as archived from flight_archive;
commit;
-- @cleanup drop table if exists flight_archive purge
