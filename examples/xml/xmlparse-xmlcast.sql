select xmlcast(xmlquery('/fare/amount/text()' passing x returning content) as number)
         as amount,
       xmlcast(xmlquery('/fare/@currency' passing x returning content) as varchar2(3))
         as currency
from   (select xmlparse(document '<fare currency="USD"><amount>612.50</amount></fare>')
                 as x);
