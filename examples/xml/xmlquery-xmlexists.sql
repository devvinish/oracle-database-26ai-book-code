with docs as (
  select xmltype('<booking ref="K7QX2P">
                    <ticket cabin="BUSINESS"/><ticket cabin="ECONOMY"/>
                  </booking>') as doc
  from   dual
)
select xmlexists('/booking/ticket[@cabin="BUSINESS"]' passing doc) as has_business,
       xmlcast(xmlquery('count(/booking/ticket)' passing doc returning content) as number)
         as tickets,
       xmlserialize(content
         xmlquery('for $t in /booking/ticket return <c>{data($t/@cabin)}</c>'
                  passing doc returning content)) as flwor
from   docs;
