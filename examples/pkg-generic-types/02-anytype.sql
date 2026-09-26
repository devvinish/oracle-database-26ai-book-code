-- @setup drop type if exists seat_t force
create type seat_t as object (seat_no varchar2(4), cabin varchar2(8), window boolean);
/
declare
  v_data  sys.anydata := anydata.convertobject(seat_t('12A', 'ECONOMY', true));
  v_type  sys.anytype;
  v_code  pls_integer;
  v_prec pls_integer; v_scale pls_integer; v_len pls_integer; v_csid pls_integer;
  v_csfrm pls_integer; v_schema varchar2(128); v_name varchar2(128); v_version varchar2(30);
  v_count pls_integer; v_attr_type sys.anytype; v_attr_name varchar2(128);
begin
  v_code := v_data.gettype(v_type);                   -- the type of the value inside
  v_code := v_type.getinfo(v_prec, v_scale, v_len, v_csid, v_csfrm, v_schema, v_name,
                           v_version, v_count);
  dbms_output.put_line(v_schema || '.' || v_name || ': typecode ' || v_code
                       || case v_code when dbms_types.typecode_object then ' (object)' end
                       || ', ' || v_count || ' attributes');
  for i in 1 .. v_count loop
    v_code := v_type.getattreleminfo(i, v_prec, v_scale, v_len, v_csid, v_csfrm,
                                     v_attr_type, v_attr_name);
    dbms_output.put_line('  ' || v_attr_name || ': typecode ' || v_code);
  end loop;
end;
/
-- @cleanup drop type if exists seat_t force
