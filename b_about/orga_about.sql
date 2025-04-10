SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;

select 
  'title'   as component,
  'À propos du projet Co-op' as contents,
   TRUE      as center;

select 
  'foldable' as component;
select 
  section_title as title,
  'foldablemargin' as class,
  section_content  as description_md
 from info_sections where section_category="about" AND section_status='active' ORDER BY section_number ASC;
