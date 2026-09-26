-- @expect-error
insert into fare_rules (rule_id, route_id, cabin, valid_from, base_fare)
values (2, 1, 'FIRST', date '2026-04-01', 900);

insert into fare_rules (rule_id, route_id, valid_from, base_fare)
values (3, 999, date '2026-04-01', 100);

insert into fare_rules (rule_id, route_id, valid_from, valid_to, base_fare)
values (4, 1, date '2026-04-01', date '2026-03-01', 100);
