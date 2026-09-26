select first_name, last_name, soundex(last_name) as code
from   customers
where  soundex(last_name) = soundex('Smyth')
   or  soundex(last_name) = soundex('Shurma');
