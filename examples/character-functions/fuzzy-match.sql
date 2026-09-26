select c.first_name || ' ' || c.last_name as customer,
       fuzzy_match(levenshtein, c.last_name, 'Mueller')     as levenshtein,
       fuzzy_match(jaro_winkler, c.last_name, 'Mueller')    as jaro_winkler,
       fuzzy_match(trigram, c.last_name, 'Mueller')         as trigram,
       fuzzy_match(levenshtein, c.last_name, 'Mueller', unscaled) as edits
from   customers c
where  fuzzy_match(jaro_winkler, c.last_name, 'Mueller') >= 70
order  by jaro_winkler desc;
