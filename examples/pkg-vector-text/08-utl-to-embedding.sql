-- the same embedding as VECTOR_EMBEDDING, through the package
select vector_dimension_count(v) as dimensions,
       vector_distance(v, vector_embedding(all_minilm_l12_v2 using 'Wi-Fi did not work'
                                            as data), cosine) as distance_to_sql
from   (select dbms_vector.utl_to_embedding('Wi-Fi did not work',
                 json('{"provider": "database", "model": "ALL_MINILM_L12_V2"}')) as v);

-- split a document into chunks and embed each one, in one query
select json_value(e.column_value, '$.embed_id') as id,
       json_value(e.column_value, '$.embed_data') as chunk,
       vector_dimension_count(to_vector(json_value(e.column_value, '$.embed_vector'
                                                   returning clob))) as dimensions
from   table(dbms_vector_chain.utl_to_embeddings(
               dbms_vector_chain.utl_to_chunks(
                 dbms_vector_chain.utl_to_text(
                   to_blob(bfilename('NIMBUS_FILES', 'welcome.txt'))),
                 json('{"by": "words", "max": "15", "split": "sentence"}')),
               json('{"provider": "database", "model": "ALL_MINILM_L12_V2"}'))) e;
