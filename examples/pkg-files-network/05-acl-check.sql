select host, lower_port, upper_port, privilege, status from user_host_aces order by 1, 4;

select column_value as matching_acl_hosts
from   dbms_network_acl_utility.domains('api.flights.example.com');
