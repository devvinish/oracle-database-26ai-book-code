select xmlserialize(content
         xmlelement("routes", xmlattributes(origin as "from"),
           xmlagg(xmlelement("to", destination) order by destination))
         indent size = 2) as routes_xml
from   routes
where  origin = 'SYD'
group  by origin;
