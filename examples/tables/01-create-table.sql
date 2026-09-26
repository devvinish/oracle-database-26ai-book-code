-- @setup drop table if exists fare_rules purge
create table fare_rules (
  rule_id       number        constraint fare_rules_pk primary key,
  route_id      number        not null constraint fare_rules_route_fk references routes,
  cabin         varchar2(8)   default 'ECONOMY' not null,
  valid_from    date          not null,
  valid_to      date,
  base_fare     number(8,2)   not null,
  refundable    boolean       default false,
  notes         varchar2(200),
  constraint fare_rules_cabin_ck check (cabin in ('BUSINESS', 'ECONOMY')),
  constraint fare_rules_dates_ck check (valid_to is null or valid_to > valid_from),
  constraint fare_rules_uk unique (route_id, cabin, valid_from)
);

insert into fare_rules (rule_id, route_id, valid_from, base_fare)
values (1, 1, date '2026-04-01', 520);

select rule_id, route_id, cabin, valid_from, base_fare, refundable from fare_rules;
