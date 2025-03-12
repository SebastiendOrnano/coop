SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;
select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion superviseurr'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
select 
    'Liste des projet'            as title,
    '/e_projects/project_main_display_4.sql' as link;
select
    'Participants au projet'            as title,
    '/e_project_participants/project_participant_main_display_4.sql?project_id='||$project_id  as link;

SELECT 
    'form' as component,
    '' as validate;
select 
    'project_id' as name,
    'hidden' as type,
    $project_id as value,
    'id' as label;
SELECT
    'project_name' as name,
    TRUE as readonly,
    'Nom du projet' as label,
     6 as width,
    (select project_name  FROM projects WHERE project_id = $project_id) as value;

select 
    'title'   as component,
    'Ajouter un groupement' as contents,
    3         as level;

SELECT 
    'form'      AS component,
    'Ajouter un groupe' as validate,
    '/e_project_participants/project_participant_main_attach4_0.sql?project_id='||$project_id AS action;

select 
   'prm3_id' as name,
    'Nom du groupe' as label,
    'select' as type,
    8 AS width,
    TRUE as searchable,
    'Saisissez quelques lettres du nom que vous cherchez ou choississez dans la liste' as empty_option,
    json_group_array(json_object('label',prm3_name, 'value', prm3_id)) AS options
    FROM (
    SELECT prm3_name, prm3_id
    FROM prm3 
    ORDER BY prm3_name ASC
    );

 SELECT 
    'project_participant_role'            as name,
    'Rôle dans le groupement'    as label,
    'select'                       as type,
    4                              AS width,
    'Choisir un rôle...'           as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="project_role"
    ORDER BY  i.choice_label ASC;