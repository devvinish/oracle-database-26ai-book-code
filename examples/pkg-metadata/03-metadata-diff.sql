-- @expect-error
-- @setup drop table if exists countries_v2 purge
create table countries_v2 (
  country_code  char(2) primary key,
  country_name  varchar2(80) not null,
  region        varchar2(30),
  currency_code char(3),
  iso_numeric   number(3)
);

select dbms_metadata_diff.compare_alter('TABLE', 'COUNTRIES', 'COUNTRIES_V2') as changes
from   dual;
-- @cleanup drop table if exists countries_v2 purge
