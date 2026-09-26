select collation(city)                         as column_collation,
       collation(city collate binary_ci)       as expression_collation,
       nls_collation_id('BINARY_AI')           as id,
       nls_collation_name(nls_collation_id('BINARY_AI')) as name
from   airports
where  airport_code = 'DXB';

select city from airports where city collate binary_ai = 'sao paulo';
