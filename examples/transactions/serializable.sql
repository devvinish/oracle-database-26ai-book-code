set transaction isolation level serializable;
select dbms_transaction.local_transaction_id is not null as has_transaction;
select count(*) as flights from flights;
commit;
