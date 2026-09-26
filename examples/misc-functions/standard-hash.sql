select standard_hash('Nimbus Air')             as sha1,
       standard_hash('Nimbus Air', 'MD5')      as md5,
       lower(rawtohex(standard_hash('Nimbus Air', 'SHA256'))) as sha256_hex
from   dual;
