spool /tmp/airports.csv
set sqlformat csv
select airport_code, city from airports where country_code = 'GB';
spool off
host cat /tmp/airports.csv
