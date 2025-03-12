SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SELECT 
    'form' as component,
    'Info sur le site - Infos légales - CGU - Help - Overview' as title,
    'Créer' as validate,
    'Clear' as reset,
    '/a_info/section_main_create_0.sql' as action;

SELECT 
    'section_category'           as name,
    'Choix de la catégorie'      as label,
    'select'                     as type,
    4                            AS width,
    '1: en attente de publication / 2 : publié / archive'                                    as description,
    'Choisir la catégorie...'                                                     as empty_option,
    '[
    {"label": "Infos générales sur le site", "value": "hero"},   
    {"label": "Infos générales sur l''organisation", "value": "about"},
    {"label": "Infos légales", "value": "legal"},
    {"label": "CGU", "value": "CGU"},
    {"label": "CGV", "value": "CGV"},
    {"label": "manuel d''utilisation pour les utilisateurs", "value": "help_user"},
    {"label": "manuel d''utilisation pour les développeurs", "value": "help-dev"}
    ]'                                                                                         as options;

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

select 
    'button' as component,
    'sm'     as size;
select 
    '/a_info/section_display_5.sql'     as link,
    'orange' as outline,
    'Retour à la liste des sections'  as title,
    'arrow-back'  as icon;

