select column_value as code
from   table(sys.odcivarchar2list('NM_101', 'NM1010', 'NM%SALE', 'NMX101'))
where  column_value like 'NM\_%' escape '\';
