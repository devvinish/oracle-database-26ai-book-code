select name,
       phonic_encode(double_metaphone, name)     as primary_code,
       phonic_encode(double_metaphone_alt, name) as alternate_code
from   (values ('Schmidt'), ('Smith'), ('Smyth'), ('Philips'), ('Filips')) t (name);
