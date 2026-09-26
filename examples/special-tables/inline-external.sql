select *
from   external (
         (airport_code char(3), price_date varchar2(10), usd_per_gallon number)
         type oracle_loader default directory nimbus_files
         access parameters (records delimited by newline skip 1 fields terminated by ',')
         location ('fuel_prices.csv')
         reject limit unlimited)
where  airport_code = 'LHR';
