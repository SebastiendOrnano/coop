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
    '/e_projects/project_main_display_4.sql'      as link;


SELECT 
    'form' as component,
    'Créer un projet' as title,
    'Créer' as validate,
    'project_main_create_0.sql' as action;

SELECT
    'project_name' as name,
    'text' as type,  
    'Nom' as label,
    TRUE as required;

SELECT
    'project_summary' as name,
    'textarea' as type,  
    'Pitch' as label;

SELECT 
    'project_date_creation'      as name,
    'Date de création'           as label,
    'date'                       as type,
    3                            AS width,
   (select regex_value from regex where regex_name='date')         as pattern,
   (select regex_description from regex where regex_name='date')   as description;

SELECT 
    'project_category'             as name,
    'Catégorie'                    as label,
    'select'                       as type,
    TRUE                           as required,
    6                              AS width,
    'Choisir un statut dans la liste...'    as  empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="project_category"
    ORDER BY  i.choice_label ASC;


















