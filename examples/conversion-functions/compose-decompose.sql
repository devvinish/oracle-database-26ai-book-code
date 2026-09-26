select decompose('São Paulo')            as decomposed,
       length(decompose('São Paulo'))    as len_decomposed,
       compose('Sa' || unistr('\0303') || 'o') as composed,
       length(compose('Sa' || unistr('\0303') || 'o')) as len_composed,
       asciistr(decompose('São'))        as escaped
from   dual;
