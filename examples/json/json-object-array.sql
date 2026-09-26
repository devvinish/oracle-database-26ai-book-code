select json_object('code' value airport_code, 'city' value city, 'hub' value is_hub,
                   'coords' value json_array(latitude, longitude)) as airport_json
from   airports
where  airport_code in ('DXB', 'KTM');

select json_object(*) as whole_row from aircraft_types where type_code = 'A359';
