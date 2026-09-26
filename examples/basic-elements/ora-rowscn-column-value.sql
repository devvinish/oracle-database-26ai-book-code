select airport_code, ora_rowscn from airports where airport_code in ('DXB', 'SIN');

select column_value from table(sys.odcinumberlist(10, 20, 30));
