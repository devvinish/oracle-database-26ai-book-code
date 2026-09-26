select c.customer_id, j.*
from   customers c,
       json_table(c.loyalty, '$'
         columns (member_id  varchar2(10)  path '$.memberId',
                  tier       varchar2(10)  path '$.tier',
                  points     number        path '$.points',
                  seat       varchar2(10)  path '$.preferences.seat',
                  nested path '$.favoriteAirports[*]'
                    columns (fav_no for ordinality, airport varchar2(3) path '$'))) j
where  c.customer_id in (1, 2);
