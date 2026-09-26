-- block time as a straight line of distance: minutes = slope * km + intercept
select round(regr_slope(block_minutes, distance_km), 5)     as slope,
       round(regr_intercept(block_minutes, distance_km), 1) as intercept,
       round(regr_r2(block_minutes, distance_km), 4)        as r_squared,
       regr_count(block_minutes, distance_km)               as n,
       round(regr_avgx(block_minutes, distance_km))         as avg_km,
       round(regr_avgy(block_minutes, distance_km))         as avg_minutes
from   routes;
