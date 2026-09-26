select json_value(c.column_value, '$.chunk_id')     as id,
       json_value(c.column_value, '$.chunk_offset') as offset,
       json_value(c.column_value, '$.chunk_length') as len,
       json_value(c.column_value, '$.chunk_data')   as chunk
from   table(dbms_vector_chain.utl_to_chunks(
         dbms_vector_chain.utl_to_text(to_blob(bfilename('NIMBUS_FILES', 'welcome.txt'))),
         json('{"by":"words", "max":"15", "overlap":"0", "split":"sentence",
                "normalize":"all"}'))) c;
