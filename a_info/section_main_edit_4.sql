SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;


select 
    'form'                        as component,
    'Mise à jour d''une section'  as title ,
    'Mettre à jour de la section' as validate,
    'Annuler'                     as reset,
    'green'                       as validate_color,
    '/a_info/section_main_update_0.sql?section_id=' || (select section_id FROM  info_sections WHERE section_id = $section_id)  as action;


select 
    'section_id' as name,
    'hidden' as type,
     4                     AS width,
    (select section_id  FROM  info_sections WHERE section_id = $section_id)   as value,
    'Id' as label;

select 
    'section_category' as name,
    'readonly' as type,
     4                     AS width,
    (select section_category  FROM  info_sections WHERE section_id = $section_id)   as value,
    'Catégorie' as label;

select 
    'section_number'      as name,
    'text'                as type,
    2                    AS width,
    'N° d''ordre de la section' as label,
    (select section_number  FROM  info_sections WHERE section_id = $section_id)   as value;
   
SELECT
    'section_lang'                               as name,
    'select'                                     as type,  
    'Langue'                                     as label,
    TRUE                                         as required,
    2                                            AS width,
    'Choisir la langue...'                       as empty_option,
    (select section_lang  FROM  info_sections WHERE section_id = $section_id)   as value,
   '[
   {"label": "Français", "value": "FR"}, 
   {"label": "English", "value":"EN"}
   ]'                                            as options;


SELECT 
    'section_status'        as name,
    'statut de publication actuel'      as label,
    'select'                            as type,
    4                    AS width,
    '1: en attente de publication / 2 : publié / archive' as description,
    (select section_status FROM  info_sections WHERE section_id = $section_id)   as value,
    'Choisir le statut de publication...' as empty_option,
    '[
    {"label": "En attente de publication", "value": "no"},
    {"label": "Publié", "value": "yes"},
    {"label": "Archive", "value": "archived"}
    ]' as options;

SELECT 
    'section_title' as name,
    'text' as type,
    (select section_title  FROM  info_sections WHERE section_id = $section_id)   as value,
    'titre de la section' as label;

SELECT
    'section_content' as name,
    'textarea' as type,  
    'Contenu de la section' as label,
    (select section_content  FROM info_sections WHERE section_id = $section_id) as value;

SELECT
    'button' as component,
    'sm'     as size;
SELECT
    '/a_info/section_main_display_4.sql'     as link,
     'warning' as color,
    'Annuler'  as title,
    'arrow-back'  as icon;

