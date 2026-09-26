select last_name, nlssort(last_name, 'NLS_SORT = BINARY_CI') as sort_key
from   employees
where  last_name in ('Zhang', 'van der Berg', 'Al Mansoori', 'Aziz', 'Okafor')
order  by last_name;

select last_name
from   employees
where  last_name in ('Zhang', 'van der Berg', 'Al Mansoori', 'Aziz', 'Okafor')
order  by nlssort(last_name, 'NLS_SORT = BINARY_CI');
