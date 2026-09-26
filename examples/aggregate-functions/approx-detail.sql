-- @setup drop table if exists monthly_customers purge
-- keep a mergeable summary per month, then combine the months without the raw rows
create table monthly_customers as
  select trunc(booked_at, 'MM') as month,
         approx_count_distinct_detail(customer_id) as detail
  from   bookings
  group  by trunc(booked_at, 'MM');

select month, to_approx_count_distinct(detail) as customers
from   monthly_customers
order  by month;

select to_approx_count_distinct(approx_count_distinct_agg(detail)) as all_months
from   monthly_customers;
-- @cleanup drop table if exists monthly_customers purge
