-- @expect-error
select json_value('{"points":"many"}', '$.points' returning number null on error)
         as null_on_error,
       json_value('{"points":"many"}', '$.points' returning number default -1 on error)
         as dflt
from   dual;

select json_value('{"points":"many"}', '$.points' returning number error on error) as strict
from   dual;
