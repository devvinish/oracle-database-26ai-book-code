create or replace package mask_ptf as
  function describe (tab in out dbms_tf.table_t, cols in dbms_tf.columns_t)
    return dbms_tf.describe_t;
  procedure fetch_rows;
end;
/
create or replace package body mask_ptf as
  function describe (tab in out dbms_tf.table_t, cols in dbms_tf.columns_t)
    return dbms_tf.describe_t is
    v_new dbms_tf.columns_new_t;
  begin
    for i in 1 .. tab.column.count loop
      if tab.column(i).description.name member of cols then
        tab.column(i).pass_through := false;         -- the original column is hidden
        tab.column(i).for_read     := true;          -- but read by FETCH_ROWS
        v_new(v_new.count + 1) := dbms_tf.column_metadata_t(
          name => trim(both '"' from tab.column(i).description.name) || '_MASKED',
          type => dbms_tf.type_varchar2);
      end if;
    end loop;
    return dbms_tf.describe_t(new_columns => v_new);
  end;

  procedure fetch_rows is
    v_rows  dbms_tf.row_set_t;
    v_count pls_integer;
    v_out   dbms_tf.tab_varchar2_t;
  begin
    dbms_tf.get_row_set(v_rows, v_count);
    for c in 1 .. v_rows.count loop                  -- each column read, in order
      for r in 1 .. v_count loop
        v_out(r) := regexp_replace(v_rows(c).tab_varchar2(r), '[[:alnum:]]', '*', 3);
      end loop;
      dbms_tf.put_col(c, v_out);
    end loop;
  end;
end;
/
create or replace function mask_cols (tab table, cols columns)
  return table pipelined row polymorphic using mask_ptf;
/
select customer_id, email_masked, phone_masked
from   mask_cols(customers, columns(email, phone))
where  customer_id <= 3;
-- @cleanup drop function if exists mask_cols
-- @cleanup drop package if exists mask_ptf
