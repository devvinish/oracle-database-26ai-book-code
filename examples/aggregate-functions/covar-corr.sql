select round(covar_pop(distance_km, block_minutes))  as covar_pop,
       round(covar_samp(distance_km, block_minutes)) as covar_samp,
       round(corr(distance_km, block_minutes), 4)    as corr,
       round(corr_s(distance_km, block_minutes), 4)  as spearman,
       round(corr_k(distance_km, block_minutes), 4)  as kendall
from   routes;
