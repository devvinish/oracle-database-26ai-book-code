with q as (select vector_embedding(all_minilm_l12_v2 using 'My luggage did not arrive'
                                   as data) as e)
select vector_dimension_count(e) as dimensions, vector_dimension_format(e) as format,
       round(vector_distance(e, vector_embedding(all_minilm_l12_v2
               using 'Where is my suitcase?' as data), cosine), 3) as to_suitcase,
       round(vector_distance(e, vector_embedding(all_minilm_l12_v2
               using 'What time does boarding start?' as data), cosine), 3) as to_boarding
from   q;
