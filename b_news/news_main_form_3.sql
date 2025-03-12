SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Éditeur'         as title,
    '/a_panels/panel_editor_3.sql' as link;

SELECT 
    'form' as component,
    'Créer un article' as title,
    'Créer' as validate,
    '/b_news/news_main_create_0.sql' as action;

SELECT
    'news_title'           as name,
    'text'                 as type,  
    'Titre de l''article'  as label,
    12                      AS width,
    TRUE                   as required;

 SELECT 
    'news_public_private'     as name,
    'Public / Privé'      as label,
    'select'                     as type,
    3                            AS width,
    TRUE                          as required,
    'Choisir un statut dans la liste...' as  empty_option,
    '[{"label": "Public", "value": "public"},
    {"label": "Privé", "value": "private"}
    ]'  as options;

SELECT 
    'news_date'                as name,
    'Date'                      as label,
    'date'                      as type,
    3                            AS width,
    TRUE                          as required,
   (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')          as description;

SELECT 
    'news_category'               as name,
    'Catégorie'                   as label,
    'select'                       as type,
    3                              AS width,
    'Choisir une categorie dans la liste...'    as empty_option,
    '[{"label": "Annonce", "value": "annoncement"},
    {"label": "Tribune", "value": "comment"},
    {"label": "Info", "value": "info"},
    {"label": "Autre", "value": "N"}
    ]'  as options;


SELECT
    'news_content'                 as name,
    'textarea'                     as type,  
    'Contenu de l''article'        as label,
    'A saisier en format markdown' as description,
    TRUE                           as required;

select 
    'file'                  as type, 
    'news_img_url'          as name,
    'Illustration'    as label,
    'image/pdf,jpg,jpeg,png,gif'  as accept;


