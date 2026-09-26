comment on table fare_rules is 'Base fares by route, cabin, and validity period';
comment on column fare_rules.base_fare is 'Fare in USD before taxes';

alter table fare_rules annotations (owner 'Revenue Management', review_cycle 'quarterly');
alter table fare_rules
  modify (base_fare annotations (unit 'USD', display_label 'Base fare'));

select object_name, column_name, annotation_name, annotation_value
from   user_annotations_usage
where  object_name = 'FARE_RULES'
order  by column_name nulls first, annotation_name;
