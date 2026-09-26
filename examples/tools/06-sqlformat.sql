set sqlformat csv
select airport_code, city, elevation_ft from airports where country_code = 'IN';

set sqlformat json
select airport_code, city from airports where country_code = 'AE';

set sqlformat insert
select country_code, country_name from countries where country_code = 'NP';
