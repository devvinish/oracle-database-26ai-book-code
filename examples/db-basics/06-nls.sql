select parameter, value from nls_database_parameters
where  parameter in ('NLS_CHARACTERSET', 'NLS_NCHAR_CHARACTERSET', 'NLS_LANGUAGE',
                     'NLS_TERRITORY')
order  by 1;

alter session set nls_language = 'GERMAN' nls_territory = 'GERMANY';
select to_char(date '2026-03-15', 'FMDay, DD. Month YYYY') as datum,
       to_char(1234567.891, '999G999G990D00') as zahl
from   dual;

alter session set nls_language = 'AMERICAN' nls_territory = 'AMERICA';
select to_char(date '2026-03-15', 'FMDay, Month DD, YYYY') as day,
       to_char(1234567.891, '999G999G990D00') as num
from   dual;
