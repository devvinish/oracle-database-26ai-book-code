-- @setup drop table if exists meal_orders purge
create table meal_orders (
  ticket_id  number,
  meal       varchar2(20) default on null for insert and update 'standard',
  ordered_at timestamp    default localtimestamp
);

insert into meal_orders (ticket_id, meal) values (1, null), (2, 'vegan');
update meal_orders set meal = null where ticket_id = 2;
select ticket_id, meal from meal_orders order by ticket_id;
-- @cleanup drop table if exists meal_orders purge
