SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
SELECT
    '/c_workspaces/workspace_hub_display_4.sql?workspace_id='||$workspace_id  as link,
    'Retour hub du groupe de travail' as title;
select 
    'Gestion des documents partagés en ligne'            as title,
    '/c_workspaces/workdoc_cloud_display_4.sql?workspace_id='||$workspace_id  as link;

SELECT 
    'form' as component,
    'Créer un document' as title,
    'Créer' as validate,
    'Clear' as reset,
    '/c_workspaces/workdoc_cloud_create_0.sql?workspace_id='||$workspace_id as action;

SELECT
    'workdoc_cloud_title' as name,
    'text' as type,  
    'Titre' as label,
    'Choisissez un titre explicite pour faciliter les recherches' as description,
    'Rapport d''activité 2024' as placeholder,
    TRUE as required,
    12 AS width;

select 
    'text' as type, 
    'workdoc_cloud_url' as name,
    'URL du document partagé sur le cloud' as label,
    TRUE       as required;

select 
    'workdoc_cloud_summary' as name,
    'textarea' as type,
    'Résumé' as label,
    12 AS width;

SELECT 
    'workdoc_cloud_lang'        as name,
    'Langue'               as label,
    'select'                as type,
    2                       AS width,
    'Choisir une langue...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="lang"
    ORDER BY  i.choice_label ASC;
   
 SELECT 
    'workdoc_cloud_format'        as name,
    'Format'                 as label,
    'select'                 as type,
    2                       AS width,
    'Choisir un format...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="doc_format"
    ORDER BY  i.choice_label ASC;
 
SELECT 
    'workdoc_cloud_category'        as name,
    'Catégorie'                 as label,
    'select'                 as type,
    3                       AS width,
    'Choisir une categorie...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="doc_category"
    ORDER BY  i.choice_label ASC;

SELECT 
    'workdoc_cloud_type'        as name,
    'Type de document'   as label,
    'select'                  as type,
    3                         AS width,
    'Choisir un type...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="doc_type"
    ORDER BY  i.choice_label ASC;






