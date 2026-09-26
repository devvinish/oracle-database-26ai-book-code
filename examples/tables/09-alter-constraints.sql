alter table fare_rules add constraint fare_rules_fare_ck check (base_fare > 0);
alter table fare_rules disable constraint fare_rules_dates_ck;
alter table fare_rules modify constraint fare_rules_fare_ck enable novalidate;

select constraint_name, constraint_type, status, validated, deferrable
from   user_constraints
where  table_name = 'FARE_RULES'
order  by constraint_name;

alter table fare_rules enable constraint fare_rules_dates_ck;
