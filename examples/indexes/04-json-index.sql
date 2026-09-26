-- @setup drop index if exists customers_tier_ix
create index customers_tier_ix on customers c (c.loyalty.tier.string());

explain plan for select customer_id from customers c where c.loyalty.tier.string() = 'Gold';
select * from table(dbms_xplan.display(format => 'BASIC'));
