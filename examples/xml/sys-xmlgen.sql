select sys_xmlgen(airport_code).getstringval() as generated from airports where rownum = 1;

select xmlserialize(content sys_xmlagg(sys_xmlgen(airport_code)) indent size = 2)
         as aggregated
from   airports
where  country_code = 'IN';
