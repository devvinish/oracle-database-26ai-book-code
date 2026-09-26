select review_id,
       regexp_count(review_text, '\w+')          as words,
       regexp_count(review_text, 'the', 1, 'i')  as the_count,
       regexp_count(review_text, '[.!?]')        as sentences
from   reviews
where  review_id <= 3;
