select rating, review_id,
       count(*) over (order by rating groups between current row and current row)
         as same_rating,
       count(*) over (order by rating rows between unbounded preceding
                                            and unbounded following exclude current row)
         as others,
       count(*) over (order by rating groups between 1 preceding and 1 following
                      exclude group) as neighbours
from   reviews
where  review_id <= 8
order  by rating, review_id;
