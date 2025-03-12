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
    'Liste des espaces de travail'            as title,
     '/c_workspaces/workspace_main_display_4.sql'  as link;

SELECT 
    'form' as component,
    'Créer un espace de travail' as title,
    'Créer' as validate,
    'Reset' as reset,
    '/c_workspaces/workspace_main_create_0.sql' as action;

SELECT
    'workspace_title' as name,
    'text' as type,  
    'Nom de l''espace de travail' as label,
    TRUE as required,
    8 as width,
    'Nom' AS placeholder;

SELECT
    'workspace_summary' as name,
    'textarea'          as type,  
    'Présentation'      as label;

SELECT 
    'workspace_category' as name,
    'categorie'          as label,
    3                   AS width,
    'select'                 as type,    
    'Choississez une categorie dans la liste' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="workspace_category"
    ORDER BY  i.choice_label ASC;

SELECT 
    'workspace_status'       as name,
    'Statut'                 as label,
    'select'                 as type,
    3                       AS width,
    TRUE                     as required,
    'Choississez un statut dans la liste' as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;


