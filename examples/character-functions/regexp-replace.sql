select phone,
       regexp_replace(phone, '\D')                       as digits_only,
       regexp_replace(phone, '^\+(\d+) (.*)$', '(\1) \2') as reformatted,
       regexp_replace(phone, '\d', '*', 1, 3)            as third_digit
from   customers
where  customer_id in (1, 2);

select regexp_replace('Nimbus   Air    Cargo', ' {2,}', ' ')   as squeezed,
       regexp_replace('NM101 NM102', '([A-Z]+)(\d+)', '\2-\1') as swapped,
       regexp_replace('DXB-lhr-Sin', '[a-z]+', 'x', 1, 0, 'i')  as case_insensitive
from   dual;
