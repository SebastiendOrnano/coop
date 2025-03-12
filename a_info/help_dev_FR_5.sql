SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

select 
    'title'   as component,
    'Help Dev' as contents,
    TRUE      as center;


SELECT
'text' as component,
'Préambule' as title;
SELECT
'Aide en ligne concernant la structure du gabarit CO-OP' as contents_md;

select 
     'foldable' as component;
        ;
select 
   section_title        as title,
   'foldablemargin'     as class,
   section_content      as description_md
from info_sections where section_category="help-dev" AND section_status='yes' AND section_lang='FR' ORDER BY section_number ASC;