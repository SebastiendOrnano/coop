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
    'Gestion des documents'            as title,
    '/c_workspaces/workdoc_display_4.sql?workspace_id='||$workspace_id  as link;

SELECT 
    'form' as component,
    'Actualiser un document' as title,
    'Actualiser' as validate,
    'Clear' as reset,
    '/c_workspaces/workdoc_update_0.sql?workdoc_id='||$workdoc_id||'&workspace_id='||$workspace_id as action;

SELECT
    'workdoc_title' as name,
    'text' as type,  
    'Titre' as label,
    'Choisissez un titre explicite pour faciliter les recherches' as description,
    (SELECT workdoc_title FROM workdocs WHERE workspace_id=$workspace_id) as value,
    'Rapport d''activité 2024' as placeholder,
    TRUE as required,
    6 AS width;

SELECT
    'workdoc_author' as name,
    'text' as type,  
    'Author' as label,
    (SELECT workdoc_author FROM workdocs WHERE workspace_id=$workspace_id) as value,
    6 AS width;

select 
    'file' as type, 
    'workdoc_url' as name,
    'Nouvelle version du doc' as label,
    '*'  as accept,
    'size max : 5 MB' as description;

select 
    'workdoc_summary' as name,
    'textarea' as type,
    'Résumé' as label,
    (SELECT workdoc_summary FROM workdocs WHERE workspace_id=$workspace_id) as value,
    12 AS width;

 SELECT 
    'workdoc_status'        as name,
    'Statut'               as label,
    'select'                as type,
    (SELECT workdoc_status FROM workdocs WHERE workspace_id=$workspace_id) as value,
    2                       AS width,
    'Choisir un statut...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status_publication"
    ORDER BY  i.choice_label ASC;

select 
    'workdoc_version' as name,
    'text' as type,
    (SELECT workdoc_version FROM workdocs WHERE workspace_id=$workspace_id) as value,
    'Version du doc' as label,
    2 AS width;

 SELECT 
    'workdoc_lang'        as name,
    'Langue'               as label,
    'select'                as type,
    (SELECT workdoc_lang FROM workdocs WHERE workspace_id=$workspace_id) as value,
    2                       AS width,
    'Choisir une langue...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="lang"
    ORDER BY  i.choice_label ASC;
   
 SELECT 
    'workdoc_format'        as name,
    'Format'                 as label,
    'select'                 as type,
    (SELECT workdoc_format FROM workdocs WHERE workspace_id=$workspace_id) as value,
    2                       AS width,
    'Choisir un format...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="doc_format"
    ORDER BY  i.choice_label ASC;
 
SELECT 
    'workdoc_category'        as name,
    'Catégorie'                 as label,
    'select'                 as type,
    (SELECT workdoc_category FROM workdocs WHERE workspace_id=$workspace_id) as value,
    3                       AS width,
    'Choisir une categorie...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="doc_category"
    ORDER BY  i.choice_label ASC;

SELECT 
    'workdoc_type'        as name,
    'Type de document'   as label,
    'select'                  as type,
    (SELECT workdoc_type FROM workdocs WHERE workspace_id=$workspace_id) as value,
    3                         AS width,
    'Choisir un type...' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="doc_type"
    ORDER BY  i.choice_label ASC;






