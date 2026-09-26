-- @setup drop type if exists t_money force
create or replace type t_money as object (
  amount    number(12,2),
  currency  char(3),
  constructor function t_money (amount number) return self as result,
  member function plus (p_other t_money) return t_money,
  member function to_text return varchar2,
  map member function in_usd return number
);
/
create or replace type body t_money as
  constructor function t_money (amount number) return self as result is
  begin
    self.amount := amount;
    self.currency := 'USD';
    return;
  end;
  member function plus (p_other t_money) return t_money is
  begin
    return t_money(amount + p_other.amount, currency);
  end;
  member function to_text return varchar2 is
  begin
    return currency || ' ' || to_char(amount, 'FM999G990D00');
  end;
  map member function in_usd return number is
  begin
    return amount * case currency when 'AED' then 0.2723 else 1 end;
  end;
end;
/
declare
  v_fare  t_money := t_money(499.50);
  v_tax   t_money := t_money(24.98, 'USD');
begin
  dbms_output.put_line(v_fare.plus(v_tax).to_text);
  dbms_output.put_line(case when t_money(1000, 'AED') > t_money(200) then 'AED 1000 is more'
                            else 'USD 200 is more' end);
end;
/
