SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

SELECT
    'form'                                as component,
    'Suppression de la section'            as title,
    'Supprimer la section'              as validate,
    'red'                                    as validate_color,
    '/a_info/section_main_delete_0.sql?section_id=' ||$section_id as action;

select 
    'section_id' as name,
    TRUE as readonly,
    'Id' as label,
  2 as width,
    section_id AS value
FROM info_sections  
WHERE section_id = $section_id;

select 
    'section_number' as name,
    TRUE as readonly,
    'N°' as label,
    2 as width,
    section_number AS value
FROM info_sections  
WHERE section_id = $section_id;

select 
    'section_category' as name,
    TRUE as readonly,
    'Categorie' as label,
   4 as width,
    section_category AS value
FROM info_sections  
WHERE section_id = $section_id;

SELECT 
    'section_title' AS name,
    'titre de la section' AS label,
     TRUE as readonly,
   4 AS width,
    section_title AS value
FROM info_sections  
WHERE section_id = $section_id;

SELECT 
    'section_content' AS name,
    'contenu de la section' AS label,
     TRUE as readonly,
    section_content AS value
FROM info_sections  
WHERE section_id = $section_id;

select 
    'button' as component,
    'sm'     as size;
select 
    '/a_info/section_main_display_4.sql'     as link,
    'orange' as outline,
    'Annuler'  as title,
    'arrow-back'  as icon;





