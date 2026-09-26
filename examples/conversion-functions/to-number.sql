select to_number('1,234.50', '9G999D99')                         as grouped,
       to_number('$1,234.50', 'L9G999D99', 'NLS_CURRENCY = $')   as currency,
       to_number('1.234,50', '9G999D99', 'NLS_NUMERIC_CHARACTERS = '',.''') as european,
       to_number('FF', 'XX')                                     as from_hex,
       to_number('  42 ')                                        as trimmed
from   dual;
