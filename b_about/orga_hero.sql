SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;


select 
    'foldable' as component;
select 
   section_title              as title,
   'foldablemargin'           as class,
   TRUE                       as expanded,
   section_content            as description_md
   from info_sections where section_category='hero' AND section_status='yes' AND section_number=$section_number;
