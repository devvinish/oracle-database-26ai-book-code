select phone,
       translate(phone, '+ ', '+')                         as no_spaces,
       translate(phone, '0123456789+ ', '9999999999')        as pattern,
       translate('São Paulo', 'ãáéíóú', 'aaeiou')            as unaccented
from   customers
where  customer_id in (1, 2);
