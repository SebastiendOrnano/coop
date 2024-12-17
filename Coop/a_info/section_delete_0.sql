SET section_title =  (select section_title from info_sections where section_id = $section_id);

DELETE FROM info_sections
WHERE section_id = $section_id
RETURNING
   'text' AS component,
   'La section   ***' ||$section_title ||  '***   a été supprimée.' as contents_md;

SELECT
    'button' as component,
    'sm'     as size;
SELECT
    '/a_info/section_display_5.sql'     as link,
     'warning' as color,
    'Retour à la liste des utilisateurs'  as title,
    'arrow-back'  as icon;