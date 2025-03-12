SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell.sql') AS properties;

select 
    'title'   as component,
    'CGU' as contents,
    TRUE      as center;


SELECT
'text' as component,
'Préambule' as title;
SELECT
'Les présentes Conditions Générales d''Utilisation *ci-après CGU* régissent l''accès et l''utilisation du site ***Nom du site***, édité par ***Nom de l''entreprise***, dont le siège social est situé ***Adresse de l''entreprise***. L''utilisateur reconnaît avoir pris connaissance des CGU et s''engage à les respecter.' as contents_md;

select 
     'foldable' as component;
        ;
select 
   section_title        as title,
   'foldablemargin'     as class,
   section_content      as description_md
from info_sections where section_category="CGU" AND section_status='yes' ORDER BY section_number ASC;