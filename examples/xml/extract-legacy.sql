-- deprecated functions that older code still uses
select extractvalue(x, '/fare/amount') as extractvalue,
       existsnode(x, '/fare[@currency="USD"]') as existsnode,
       extract(x, '/fare/amount').getstringval() as extract_xml
from   (select xmltype('<fare currency="USD"><amount>612.50</amount></fare>') as x);
