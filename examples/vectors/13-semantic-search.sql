-- @setup drop table if exists review_sentences purge
-- every sentence of every review, with its embedding
create table review_sentences as
select sentence, vector_embedding(all_minilm_l12_v2 using sentence as data) as embedding
from   (select distinct c.chunk_text as sentence
        from   reviews r,
               vector_chunks(r.review_text by words max 16 split by sentence) c);

-- the sentences closest in meaning to a question, whatever words they use
select sentence,
       round(vector_distance(embedding, vector_embedding(all_minilm_l12_v2
               using 'The internet connection failed' as data), cosine), 3) as distance
from   review_sentences
order  by distance
fetch  first 2 rows only;

-- similar topic, opposite meaning: embeddings capture topics better than negation
select sentence,
       round(vector_distance(embedding, vector_embedding(all_minilm_l12_v2
               using 'We left late' as data), cosine), 3) as distance
from   review_sentences
order  by distance
fetch  first 2 rows only;
-- @cleanup drop table if exists review_sentences purge
