update routes set block_minutes = block_minutes where route_id = 1;

select dbms_transaction.local_transaction_id as transaction_id,
       (select count(*) from v$locked_object l
        join user_objects o on o.object_id = l.object_id) as locked_objects
from   dual;
rollback;
