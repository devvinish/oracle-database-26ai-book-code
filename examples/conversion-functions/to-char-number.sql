select fare,
       to_char(fare, '99,990.00')       as grouped,
       to_char(fare, '$99,990.00')      as dollars,
       to_char(fare, 'L99G990D00', 'NLS_NUMERIC_CHARACTERS = '',.''
                                    NLS_CURRENCY = ''€''') as euro,
       to_char(fare, '00000')           as zeros,
       to_char(fare, 'FM99990.00')      as fm,
       to_char(fare, '99')              as too_small
from   tickets
where  ticket_id in (1, 2);

select to_char(-42, '999MI') as mi, to_char(-42, '999PR') as pr, to_char(42, 'S999') as s,
       to_char(1234567, '9.99EEEE') as sci, to_char(255, 'XX') as hex,
       to_char(2026, 'RN') as roman, to_char(12, 'FM0999') as padded
from   dual;
