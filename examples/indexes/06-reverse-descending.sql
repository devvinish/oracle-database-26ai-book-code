-- @setup drop index if exists payments_id_rev_ix
-- @setup drop index if exists payments_paid_desc_ix
create index payments_id_rev_ix on payments (payment_id, booking_id) reverse;
create index payments_paid_desc_ix on payments (paid_at desc);

select index_name, index_type, column_name, descend
from   user_indexes join user_ind_columns using (index_name, table_name)
where  table_name = 'PAYMENTS' and index_name like 'PAYMENTS_%X'
order  by index_name, column_position;
-- @cleanup drop index if exists payments_id_rev_ix
-- @cleanup drop index if exists payments_paid_desc_ix
