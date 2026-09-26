select json_value(m, '$.objectType') as object_type, json_value(m,
                  '$.objectInfo.numRows') as num_rows,
       json_query(m, '$.objectInfo.indexes[*].name' with wrapper) as indexes
from   (select dbms_developer.get_metadata(name => 'AIRCRAFT',
        object_type => 'TABLE') as m);

select c.*
from   json_table(dbms_developer.get_metadata(name => 'AIRCRAFT', object_type => 'TABLE'),
                  '$.objectInfo.columns[*]'
                  columns (name     varchar2(20) path '$.name',
                           type     varchar2(10) path '$.dataType.type',
                           len      number       path '$.dataType.length',
                           not_null varchar2(5)  path '$.notNull',
                           pk       varchar2(5)  path '$.isPk')) c;
