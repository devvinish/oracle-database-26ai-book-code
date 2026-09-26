select city, asciistr(city) as escaped, unistr('S\00E3o Paulo') as from_escapes,
       unistr('\20AC 12.50') as euro
from   airports
where  airport_code = 'GRU';
