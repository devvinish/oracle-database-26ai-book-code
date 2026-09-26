alter table fare_rules add (
  fare_with_tax number generated always as (round(base_fare * 1.05, 2)) virtual,
  season        varchar2(6) as (case when extract(month from valid_from) in (6, 7, 8)
                                       then 'SUMMER' else 'OTHER' end)
);

select rule_id, base_fare, fare_with_tax, season from fare_rules;
