select customer_id,
       json_value(loyalty, '$.tier')                                   as tier,
       json_value(loyalty, '$.points' returning number)                as points,
       json_value(loyalty, '$.memberSince' returning date)             as since,
       json_value(loyalty, '$.preferences.newsletter' returning boolean) as newsletter,
       json_value(loyalty, '$.nickname' default 'n/a' on empty)        as nickname
from   customers
where  customer_id in (1, 9);
