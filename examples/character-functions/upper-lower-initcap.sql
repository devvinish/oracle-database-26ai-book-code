select upper(city)                     as upper_city,
       lower(airport_name)             as lower_name,
       initcap('o. r. TAMBO international') as initcap_name
from   airports
where  airport_code = 'GRU';

select last_name, initcap(last_name) as initcap, nls_upper('straße') as nls_upper,
       nls_upper('straße', 'NLS_SORT = XGERMAN') as xgerman
from   employees
where  employee_id in (135, 140);
