select convert('São Paulo Café', 'US7ASCII')              as to_ascii,
       convert('Zoë', 'WE8ISO8859P1', 'AL32UTF8')        as to_latin1,
       dump(convert('Zoë', 'WE8ISO8859P1', 'AL32UTF8'))  as latin1_bytes,
       dump('Zoë')                                       as utf8_bytes
from   dual;
