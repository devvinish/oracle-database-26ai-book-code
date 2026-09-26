-- @setup drop table if exists fuel_prices_ext purge
create table fuel_prices_ext (
  airport_code   char(3),
  price_date     date,
  usd_per_gallon number(5,2)
)
organization external (
  type oracle_loader
  default directory nimbus_files
  access parameters (
    records delimited by newline
    skip 1
    fields terminated by ','
    (airport_code, price_date char(10) date_format date mask "YYYY-MM-DD", usd_per_gallon)
  )
  location ('fuel_prices.csv')
)
reject limit unlimited;

select airport_code, round(avg(usd_per_gallon), 2) as avg_price, count(*) as readings
from   fuel_prices_ext
group  by airport_code
order  by avg_price;
-- @cleanup drop table if exists fuel_prices_ext purge
