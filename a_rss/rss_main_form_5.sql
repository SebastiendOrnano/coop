SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Admin'                      as title,
    'arrow_left_double'                  as icon,
    '/a_panels/panel_admin_5.sql'        as link;
select 
    'Liste des processus'                      as title,
    'arrow_left_double'                  as icon,
    '/a_rss/rss_main_display_5.sql'        as link;

select 
    'title'   as component,
    'Nouvelle lien RSS' as contents,
    3         as level;

-- Form for replying to the topic
SELECT 'form'      AS component,
'Créer un lien RSS' as validate,
'Clear'                    as reset,
'/a_rss/rss_main_create_0.sql' AS action;

SELECT 
'rss_feed'                 AS name, 
'text'                          AS type, 
'Path + Nom du fichier'         as label,
TRUE                            as required;

SELECT 
'rss_title'                    AS name, 
'text'                         AS type, 
'Nom du lien'                  as label,
TRUE                           as required;

SELECT 
'rss_link'                    AS name, 
'text'                        AS type, 
'link'                        as label,
TRUE                          as required;

SELECT 
'rss_description'                   AS name, 
'textarea'                          AS type, 
'description'                      as label;

SELECT
    'rss_category'       as name,
    'select'                   as type,  
    'Categorie du lien'   as label,
    TRUE                     as required,
    4                       AS width,
    TRUE                     as searchable,
     'selectionnez une catégorie dans la liste' as empty_option,
   '[{"label": "Public", "value": "public"}, {"label": "Editor", "value": "editor"}, {"label": "Supervisor", "value":"supervisor"}, {"label": "Admin", "value":"admin"}]' as options;

SELECT
    'rss_status'       as name,
    'select'                   as type,  
    'Statut du lien'   as label,
    TRUE                     as required,
    4                        AS width,
    'selectionnez un statut dans la liste' as empty_option,
   '[{"label": "active", "value": "active"}, {"label": "inactive", "value":"inactive"}, {"label": "archive", "value":"archived"}]' as options;

SELECT 
    'rss_item_title'                    AS name, 
    'text'                         AS type, 
    'Item :Nom du lien'              as label,
    TRUE                           as required;

SELECT 
    'rss_item_link'                    AS name, 
    'text'                        AS type, 
    'Item : link'                        as label,
    TRUE                           as required;

SELECT 
    'rss_item_table'              AS name, 
    'text'                        AS type, 
    'Item : table'                as label,
    TRUE                          as required;

SELECT 
    'rss_item_description'                   AS name, 
    'textarea'                          AS type, 
    'Item : description'                      as label;