select case when json_equal('{"a":1,"b":[1,2]}', '{"b":[1,2],"a":1}')
            then 'equal' end as same
from   dual;

select json_dataguide(loyalty, dbms_json.format_flat, dbms_json.pretty) as dataguide
from   customers;
