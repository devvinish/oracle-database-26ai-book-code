select json_mergepatch(loyalty, '{"tier":"Platinum","preferences":{"meal":null},"vip":true}'
                       returning varchar2(400) pretty) as patched
from   customers
where  customer_id = 1;
