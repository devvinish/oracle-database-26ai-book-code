-- @setup drop function if exists slugify
create function slugify (p_text varchar2) return varchar2
  as mle language javascript
{{
  // the parameter P_TEXT is a JavaScript variable, named in uppercase
  return P_TEXT.normalize('NFD').replace(/[\u0300-\u036f]/g, '')
               .toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '');
}};
/
select city, slugify(airport_name) as slug
from   airports
where  airport_code in ('GRU', 'ORD');
-- @cleanup drop function if exists slugify
-- @cleanup drop function if exists haversine_km
-- @cleanup drop mle module if exists geo_module
