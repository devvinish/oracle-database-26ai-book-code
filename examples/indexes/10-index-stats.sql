select index_name, blevel, leaf_blocks, distinct_keys, clustering_factor, num_rows
from   user_indexes
where  table_name = 'FLIGHTS'
order  by index_name;
