create or replace package fmt is
  function money (p_amount number) return varchar2;
  function money (p_amount number, p_currency varchar2) return varchar2;
  function money (p_when date) return varchar2;
end fmt;
/
create or replace package body fmt is
  function money (p_amount number) return varchar2 is
  begin return to_char(p_amount, 'FM999G990D00'); end;
  function money (p_amount number, p_currency varchar2) return varchar2 is
  begin return p_currency || ' ' || money(p_amount); end;
  function money (p_when date) return varchar2 is
  begin return to_char(p_when, 'DD Mon YYYY'); end;
end fmt;
/
select fmt.money(1234.5) as a, fmt.money(1234.5, 'AED') as b,
       fmt.money(date '2026-03-15') as c;
