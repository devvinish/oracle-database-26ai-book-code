select name, type, referenced_name, referenced_type
from   user_dependencies
where  name = 'BOOKING_API' and referenced_owner = 'NIMBUS'
order  by type, referenced_name;
