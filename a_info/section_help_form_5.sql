SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Admin'         as title,
    '/a_panels/panel_admin_5.sql' as link;

select 
    'Gestion des sections d''aide'            as title,
    '/a_info/section_help_display_5.sql' as link;



SELECT 
    'form' as component,
    'Section de l''aide pour les dev' as title,
    'Créer' as validate,
    'Clear' as reset,
    '/a_info/section_help_create_0.sql' as action;

SELECT 
    'section_status'        as name,
    'statut de publication actuel'      as label,
    'select'                            as type,
    4                                   AS width,
    '1: en attente de publication / 2 : publié / archive'       as description,
    'Choisir le statut de publication...'                       as empty_option,
    '[
    {"label": "En attente de publication", "value": "no"},
    {"label": "Publié", "value": "yes"},
    {"label": "Archive", "value": "archived"}
    ]'                                                          as options;

SELECT
    'section_number' as name,
    'number' as type,  
    'Numéro de la section' as label,
    2 as width,
    '1, 2, 3...' AS description;


SELECT
    'section_lang'                               as name,
    'select'                                     as type,  
    'Langue'                                     as label,
    TRUE                                         as required,
    2                                            AS width,
    'Choisir la langue...'                       as empty_option,
   '[
   {"label": "Français", "value": "FR"}, 
   {"label": "English", "value":"EN"}
   ]'                                            as options;



SELECT
    'section_title' as name,
    'text' as type,  
    'Titre de la section' as label,
    'Titre de la section' AS placeholder;

SELECT
    'section_content' as name,
    'textarea' as type,  
    'Contenu de la section' as label,
    'Contenu de la section au format markdown' AS description;



