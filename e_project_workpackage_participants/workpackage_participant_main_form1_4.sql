SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

set project_id = SELECT project_id from project_workpackage where workpackage_id=$workpackage_id;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
 select 
    'Retour à la liste des projets'            as title,
    '/e_project/project_main_display_4.sql'     as link;
 select 
    'Retour au hub du projet'            as title,
    '/e_project/project_hub_display_4.sql?project_id='||$project_id     as link; 
select 
    'liste des lots de travaux'    as title,
    '/e_project_workpackage/workpackage_hub_display_4.sql?project_id='||$project_id as link;
select 
    'Participants au lot de travaux'    as title,
    '/e_project_workpackage_participants/workpackage_participant_main_display_4.sql?workpackage_id='||$workpackage_id as link;


SELECT 
    'form' as component,
    '' as validate;
select 
    'workpackage_id' as name,
    'hidden' as type,
    $workpackage_id as value,
    'id' as label;
SELECT
    'workpackage_name' as name,
    TRUE as readonly,
    'Nom du workpackage' as label,
     6 as width,
    (select workpackage_name  FROM project_workpackage WHERE workpackage_id = $workpackage_id) as value;

select 
    'title'   as component,
    'Ajouter une personne physique' as contents,
    3         as level;



SELECT 
    'form'      AS component,
    'Ajouter une personne physique' as validate,
    '/e_project_workpackage_participants/workpackage_participant_main_attach1_0.sql?workpackage_id='||$workpackage_id AS action;

select 
   'prm1_id' as name,
    'Nom de la personne' as label,
    'select' as type,
    8 AS width,
    TRUE as searchable,
    'Saisissez quelques lettres du nom que vous cherchez ou choississez dans la liste' as empty_option,
    json_group_array(json_object('label', prm1_last_name || '   ' || prm1_first_name, 'value', prm1_id)) AS options
    FROM (
    SELECT prm1_last_name, prm1_first_name, prm1_id
    FROM prm1 
    ORDER BY prm1_last_name ASC, prm1_first_name ASC
    );

 SELECT 
    'workpackage_participant_role'            as name,
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