-- @client sqlplus
set pagesize 30 linesize 80 feedback off
column airport_code heading 'Code' format a4
column city         heading 'City' format a12
column elevation_ft heading 'Elevation|(ft)' format 9,990
column country_code noprint
break on country_code skip 1
select country_code, airport_code, city, elevation_ft
from   airports
where  country_code in ('IN', 'US')
order  by country_code, airport_code;
