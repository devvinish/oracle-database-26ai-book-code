-- @setup drop index if exists reviews_hvi force
-- words and meaning in one index: Oracle Text and vectors from the model
create hybrid vector index reviews_hvi on reviews (review_text)
  parameters ('model ALL_MINILM_L12_V2 vector_idxtype ivf');

-- reviews about a broken connection (by meaning) that mention a delay (by word)
select r.review_id, r.rating, h.score, h.vector_score, h.text_score
from   json_table(
         dbms_hybrid_vector.search(json('{
           "hybrid_index_name": "REVIEWS_HVI",
           "vector": {"search_text": "the internet connection failed"},
           "text":   {"contains": "delayed"},
           "return": {"topN": 3}}')),
         '$[*]' columns (rid varchar2(18) path '$.rowid', score number path '$.score',
                         vector_score number path '$.vector_score',
                         text_score number path '$.text_score')) h
join   reviews r on r.rowid = chartorowid(h.rid)
order  by h.score desc;
-- @cleanup drop index if exists reviews_hvi force
-- @cleanup drop table if exists travel_notes purge
-- @cleanup begin ctx_ddl.drop_preference('NIMBUS_LEXER'); end;
