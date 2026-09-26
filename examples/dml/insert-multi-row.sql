insert into countries (country_code, country_name, region, currency_code)
values ('ES', 'Spain', 'Europe', 'EUR'),
       ('MX', 'Mexico', 'North America', 'MXN'),
       ('EG', 'Egypt', 'Africa', 'EGP');

select country_code, country_name from countries where country_code in ('ES', 'MX', 'EG');
rollback;
