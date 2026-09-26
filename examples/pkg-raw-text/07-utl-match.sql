-- a caller spells the name "Al Mansori": which customers could it be?
select first_name, last_name,
       utl_match.edit_distance(last_name, 'Al Mansori')            as edits,
       utl_match.edit_distance_similarity(last_name, 'Al Mansori') as edit_pct,
       utl_match.jaro_winkler_similarity(last_name, 'Al Mansori')  as jw_pct
from   customers
where  utl_match.jaro_winkler_similarity(last_name, 'Al Mansori') >= 80
order  by jw_pct desc, first_name;

select utl_match.edit_distance('Mumbai', 'Bombay')                 as edits,
       utl_match.jaro_winkler('MARTHA', 'MARHTA')                  as jaro_winkler
from   dual;
