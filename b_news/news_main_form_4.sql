SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
select 
    'Gestion des news'            as title,
    '/b_news/news_main_display_4.sql'      as link;


SELECT 
    'form' as component,
    'Créer une organization' as title,
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
    'news_status'     as name,
    'Statut de publication'      as label,
    'select'                     as type,
    3                            AS width,
    TRUE                          as required,
    'Choisir un statut dans la liste...' as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="publication_status"
    ORDER BY  i.choice_label ASC;

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
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="news_category"
    ORDER BY  i.choice_label ASC;


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


