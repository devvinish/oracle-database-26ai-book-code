select json_serialize(
         json_transform(loyalty,
           set    '$.points'           = 50000,
           rename '$.memberId'         = 'id',
           append '$.favoriteAirports' = 'SIN',
           remove '$.preferences.newsletter',
           insert '$.upgraded'         = true)
         returning varchar2(400) pretty) as transformed
from   customers
where  customer_id = 1;
