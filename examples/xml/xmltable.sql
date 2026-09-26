select x.*
from   xmltable('/fleet/aircraft'
         passing xmltype('<fleet>
                   <aircraft tail="A6-NAA"><type>A20N</type><seats>162</seats></aircraft>
                   <aircraft tail="A6-NAH"><type>A359</type><seats>325</seats></aircraft>
                 </fleet>')
         columns seq   for ordinality,
                 tail  varchar2(8) path '@tail',
                 type  varchar2(4) path 'type',
                 seats number      path 'seats') x;
