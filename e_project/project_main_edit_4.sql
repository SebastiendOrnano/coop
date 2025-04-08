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
    'Gestion des projets'            as title,
    '/b_project_sub/project_sub_main_display_4.sql?project_id='||$project_id      as link;

SELECT 
    'form' as component,
    'Actualiser les données d''un projet' as title,
    'Mettre à jour' as validate,
    'Clear' as reset,
    '/e_project/project_main_update_0.sql?project_id='||$project_id  as action;

 SELECT 
    'project_status'            as name,
    'Statut'                 as label,
    'select'                 as type,
    2 AS width,
    TRUE                     as required,
    (select project_status  FROM project WHERE project_id = $project_id) as value,
    'choisir unstatut dans la liste...'    as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;

SELECT
    'project_name' as name,
    'text' as type,  
    'Nom' as label,
    8 AS width,
    TRUE as required,
    (select project_name  FROM project WHERE project_id = $project_id) as value;

SELECT
    'project_summary' as name,
    'textarea' as type,  
    'Pitch' as label,
    (select project_summary  FROM project WHERE project_id = $project_id) as value;

SELECT 
    'project_date_creation' as name,
    'Date de création'       as label,
    'date'                      as type,
    (select project_date_creation  FROM project WHERE project_id = $project_id) as value,
    3                            AS width,
   (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')   as description;

SELECT 
    'project_category'             as name,
    'Catégorie'                    as label,
    'select'                       as type,
    6                              AS width,
    (select project_category  FROM project WHERE project_id = $project_id) as value,
    'choisir une categorie dans la liste...'    as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="project_category"
    ORDER BY  i.choice_label ASC;