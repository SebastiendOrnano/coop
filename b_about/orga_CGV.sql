SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;

SET orga_dept_name = (SELECT orga_dept_name FROM orga_dept WHERE orga_dept_id = '1');


select 
    'title'   as component,
    'CGV' as contents,
    TRUE      as center;


SELECT
'text' as component;
SELECT
'Les présentes Conditions Générales de ventes *ci-après CGV* régissent les règles commerciales des prestations réalisées par '||$orga_dept_name||'. L''utilisateur reconnaît avoir pris connaissance des CGU et s''engage à les respecter.' as contents_md;

select 
     'foldable' as component;
        ;
select 
   section_title        as title,
   'foldablemargin'     as class,
   section_content      as description_md
from info_sections where section_category="CGV" AND section_status='active' ORDER BY section_number ASC;