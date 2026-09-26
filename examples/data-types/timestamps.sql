-- @setup drop table if exists time_demo purge
create table time_demo (d date, ts timestamp(3), tstz timestamp with time zone,
                        tsltz timestamp with local time zone);
insert into time_demo values (timestamp '2026-03-15 08:30:15.123',
                              timestamp '2026-03-15 08:30:15.123',
                              timestamp '2026-03-15 08:30:15.123 Asia/Dubai',
                              timestamp '2026-03-15 08:30:15.123 Asia/Dubai');

select to_char(d, 'HH24:MI:SS') as d, ts, tstz, tsltz from time_demo;

alter session set time_zone = 'America/New_York';
select tstz, to_char(tsltz, 'DD-MON-YYYY HH24:MI:SS') as tsltz_in_new_york from time_demo;
-- @cleanup drop table if exists time_demo purge
