SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Editeur'         as title,
    '/a_panels/panel_supervisor_3.sql' as link;

select 
    'Gestion des news'            as title,
    '/b_news/news_main_display_3.sql'     as link;

SELECT 
    'form' as component,
    'Actualiser une news' as title,
    'Mettre à jour' as validate,
    'Clear' as reset,
    '/b_news/news_main_update_0.sql?news_id='||$news_id  as action;

SELECT
    'news_title'           as name,
    'text'                 as type,  
    'Titre de l''article'  as label,
    12                      AS width,
    TRUE                   as required,
    (select news_title FROM news WHERE news_id = $news_id) as value;

 SELECT 
    'news_public_private'     as name,
    'Public / Privé'      as label,
    'select'                     as type,
    3                            AS width,
    TRUE                          as required,
    (select news_public_private FROM news WHERE news_id = $news_id) as value,
    'Choisir un statut dans la liste...' as  empty_option,
    '[{"label": "Public", "value": "public"},
    {"label": "Privé", "value": "private"}
    ]'  as options;

 SELECT 
    'news_status'                as name,
    'Statut de publication'      as label,
    'select'                     as type,
    3                            AS width,
    TRUE                         as required,
    (select news_status  FROM news WHERE news_id = $news_id) as value,
    'Choisir un statut dans la liste...' as  empty_option,
    '[{"label": "En ligne", "value": "online"},
    {"label": "En attente", "value": "draft"},
    {"label": "Archivé", "value": "archived"}
    ]'  as options;

SELECT 
    'news_date'                as name,
    'Date'                      as label,
    'date'                      as type,
    (select news_date  FROM news WHERE news_id = $news_id) as value,
    3                            AS width,
    '^[0-9]{4}-(((0[13578]|(10|12))-(0[1-9]|[1-2][0-9]|3[0-1]))|(02-(0[1-9]|[1-2][0-9]))|((0[469]|11)-(0[1-9]|[1-2][0-9]|30)))$' as pattern, 
    'format : DD-MM-YYYY'       as description;

SELECT 
    'news_category'               as name,
    'Catégorie'                   as label,
    'select'                       as type,
    3                              AS width,
    (select news_category  FROM news WHERE news_id = $news_id) as value,
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
    (select news_content  FROM news WHERE news_id = $news_id) as value,
    TRUE                           as required;

select 
    'file'                  as type, 
    'news_img_url'          as name,
    'Illustration'    as label,
    'image/pdf,jpg,jpeg,png,gif'  as accept;




