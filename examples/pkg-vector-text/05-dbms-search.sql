-- @setup begin dbms_search.drop_index('NIMBUS_SEARCH'); exception when others then null; end;
begin
  dbms_search.create_index('NIMBUS_SEARCH');
  dbms_search.add_source('NIMBUS_SEARCH', 'AIRPORTS');         -- every column is searchable
  dbms_search.add_source('NIMBUS_SEARCH', 'TRAVEL_NOTES');
end;
/
-- one query over both tables: which rows mention Dubai?
select json_value(metadata, '$.SOURCE') as source,
       json_serialize(json_query(metadata, '$.KEY')) as row_key
from   nimbus_search
where  contains(data, 'Dubai') > 0
order  by 1, 2;

select json_serialize(dbms_search.get_document('NIMBUS_SEARCH', metadata) pretty)
       as document
from   nimbus_search
where  contains(data, 'laksa') > 0;
-- @cleanup begin dbms_search.drop_index('NIMBUS_SEARCH'); end;
