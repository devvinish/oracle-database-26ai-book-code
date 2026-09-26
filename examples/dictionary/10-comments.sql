select table_name, comments from user_tab_comments
where  comments is not null
order  by table_name
fetch  first 5 rows only;

select column_name, comments from user_col_comments
where  table_name = 'AIRPORTS' and comments is not null;
