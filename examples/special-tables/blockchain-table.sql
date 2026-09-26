-- @setup drop table if exists payment_ledger purge
create blockchain table payment_ledger (
  payment_id number,
  amount     number(10,2),
  paid_at    timestamp
) no drop until 0 days idle
  no delete until 16 days after insert
  hashing using "SHA2_512" version "v2";

insert into payment_ledger
select payment_id, amount, paid_at from payments where payment_id <= 3;
commit;

select payment_id, amount, orabctab_chain_id$ as chain, orabctab_seq_num$ as seq,
       length(orabctab_hash$) as hash_bytes
from   payment_ledger
order  by seq;
-- @cleanup drop table if exists payment_ledger purge
