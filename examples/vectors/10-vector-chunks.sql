select c.chunk_offset, c.chunk_length, c.chunk_text
from   reviews r,
       vector_chunks(r.review_text by words max 12 overlap 0
                     split by sentence normalize all) c
where  r.review_id = 1;
-- @cleanup drop table if exists airport_vectors purge
