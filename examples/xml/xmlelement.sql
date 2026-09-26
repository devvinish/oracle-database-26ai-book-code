select xmlserialize(content
         xmlelement("airport",
           xmlattributes(airport_code as "code", is_hub as "hub"),
           xmlelement("city", city),
           xmlforest(time_zone as "timeZone", elevation_ft as "elevation"))
         indent size = 2) as airport_xml
from   airports
where  airport_code = 'DXB';
