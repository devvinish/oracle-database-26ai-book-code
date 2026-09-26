-- is the fare in business class different from economy? (Welch's t-test)
select round(stats_t_test_indepu(cabin, fare, 'STATISTIC', 'BUSINESS'), 3) as t_value,
       round(stats_t_test_indepu(cabin, fare, 'TWO_SIDED_SIG', 'BUSINESS'), 6) as p_value
from   tickets;

-- do ratings differ between flights of different routes? (one-way ANOVA)
select round(stats_one_way_anova(f.route_id, r.rating, 'F_RATIO'), 3) as f_ratio,
       round(stats_one_way_anova(f.route_id, r.rating, 'SIG'), 4)     as significance
from   reviews r join flights f on f.flight_id = r.flight_id;
