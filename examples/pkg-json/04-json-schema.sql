declare
  c_schema constant json := json(q'[{
    "type"      : "object",
    "properties": {"memberId": {"type": "string", "pattern": "^NM[0-9]{6}$"},
                   "tier"    : {"enum": ["Blue", "Silver", "Gold", "Platinum"]},
                   "points"  : {"type": "integer", "minimum": 0}},
    "required"  : ["memberId", "tier"]}]');
  v_ok   boolean;
  v_errs json;
begin
  dbms_output.put_line('valid? ' || dbms_json_schema.is_valid(
    json('{"memberId":"NM101369","tier":"Gold","points":5200}'), c_schema));
  dbms_json_schema.is_valid(json('{"memberId":"X1","tier":"Diamond","points":-5}'),
                            c_schema, v_ok, v_errs);
  dbms_output.put_line('valid? ' || case when v_ok then 'yes' else 'no' end);
  dbms_output.put_line(json_serialize(v_errs pretty));
end;
/
select json_value(d, '$.dbObject') as db_object,
       json_serialize(json_query(d, '$.properties.REGION')) as region_column
from   (select dbms_json_schema.describe('COUNTRIES') as d);
