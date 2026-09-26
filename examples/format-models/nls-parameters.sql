select to_char(1234567.891, '9G999G999D99', 'NLS_NUMERIC_CHARACTERS = '',.''') as german,
       to_char(1234567.891, '9G99G99G999D99')                                 as indian,
       to_char(date '2026-03-15', 'Day DD Month YYYY', 'NLS_DATE_LANGUAGE = German') as de
from   dual;
