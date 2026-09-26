select nls_charset_id('AL32UTF8')           as utf8_id,
       nls_charset_name(873)                as name_873,
       nls_charset_name(2000)               as name_2000,
       nls_charset_decl_len(200, nls_charset_id('AL16UTF16')) as nchar_chars
from   dual;
