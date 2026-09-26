select utl_i18n.escape_reference('Fares < $500 & "no fees"', 'us7ascii') as escaped,
       utl_i18n.unescape_reference('Z&#xfc;rich &amp; Gen&egrave;ve') as unescaped;

select utl_i18n.get_default_iso_currency('JAPAN')          as japan_currency,
       utl_i18n.map_locale_to_iso('GERMAN', 'SWITZERLAND')  as iso_locale,
       utl_i18n.get_default_linguistic_sort('FRENCH')       as french_sort,
       utl_i18n.get_max_character_size('AL32UTF8')          as max_bytes;

declare
  v_zones utl_i18n.string_array := utl_i18n.get_local_time_zones('AUSTRALIA');
  i       pls_integer := v_zones.first;
begin
  while i is not null loop
    dbms_output.put_line(v_zones(i));
    i := v_zones.next(i);
  end loop;
end;
/
