SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET project_id= select project_id from project_docs where project_doc_id=$project_doc_id;


select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
SELECT
    '/e_projects/project_hub_display_4.sql?project_id='||$project_id  as link,
    'Retour hub du groupe de travail' as title;
select 
    'Gestion des documents'            as title,
    '/e_project_docs/project_doc_main_display_4.sql?project_id='||$project_id  as link;

SELECT 
    'form' as component,
    'Actualiser un document partagé en ligne' as title,
    'Actualiser' as validate,
    'Clear' as reset,
    '/e_project_docs/project_doc_cloud_update_0.sql?project_doc_id='||$project_doc_id||'&project_id='||$project_id as action;

SELECT
    'project_doc_title' as name,
    'text' as type,  
    'Titre' as label,
    'Choisissez un titre explicite pour faciliter les recherches' as description,
    (SELECT project_doc_title FROM project_docs WHERE project_doc_id=$project_doc_id) as value,
    'Rapport d''activité 2024' as placeholder,
    TRUE as required,
    12 AS width;

select 
    'text' as type, 
    'project_doc_cloud_url' as name,
    (SELECT project_doc_cloud_url FROM project_docs WHERE project_doc_id=$project_doc_id) as value,
    'URL du document partagé sur le cloud' as label;

select 
    'project_doc_summary' as name,
    'textarea' as type,
    'Résumé' as label,
    (SELECT project_doc_summary FROM project_docs WHERE project_doc_id=$project_doc_id) as value,
    12 AS width;

 SELECT 
    'project_doc_status'        as name,
    'Statut'               as label,
    'select'                as type,
    (SELECT project_doc_status FROM project_docs WHERE project_doc_id=$project_doc_id) as value,
    2                       AS width,
    'Choisir un statut...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status_publication"
    ORDER BY  i.choice_label ASC;

SELECT 
    'project_doc_lang'        as name,
    'Langue'               as label,
    'select'                as type,
    (SELECT project_doc_lang FROM project_docs WHERE project_doc_id=$project_doc_id) as value,
    2                       AS width,
    'Choisir une langue...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="lang"
    ORDER BY  i.choice_label ASC;
   
 SELECT 
    'project_doc_cloud_format'        as name,
    'Format'                 as label,
    'select'                 as type,
    (SELECT project_doc_cloud_format FROM project_docs WHERE project_doc_id=$project_doc_id) as value,
    2                       AS width,
    'Choisir un format...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="doc_cloud_format"
    ORDER BY  i.choice_label ASC;
 
SELECT 
    'project_doc_category'        as name,
    'Catégorie'                 as label,
    'select'                 as type,
    (SELECT project_doc_category FROM project_docs WHERE project_doc_id=$project_doc_id) as value,
    3                       AS width,
    'Choisir une categorie...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="doc_category"
    ORDER BY  i.choice_label ASC;

SELECT 
    'project_doc_type'        as name,
    'Type de document'   as label,
    'select'                  as type,
    (SELECT project_doc_type FROM project_docs WHERE project_doc_id=$project_doc_id) as value,
    3                         AS width,
    'Choisir un type...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="doc_type"
    ORDER BY  i.choice_label ASC;






