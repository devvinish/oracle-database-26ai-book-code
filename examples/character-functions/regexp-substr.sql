select email,
       regexp_substr(email, '[^@]+')              as user_name,
       regexp_substr(email, '@(.+)$', 1, 1, null, 1) as domain,
       regexp_substr(email, '[a-z]+', 1, 2)       as second_word
from   customers
where  customer_id in (3, 4);

-- split a list into rows
select level as n, regexp_substr('DXB,LHR,SIN,SYD', '[^,]+', 1, level) as airport
from   dual
connect by level <= regexp_count('DXB,LHR,SIN,SYD', ',') + 1;
