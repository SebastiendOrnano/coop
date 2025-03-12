SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

set project_id = SELECT project_id from project_workpackages where workpackage_id=$workpackage_id;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion éditeur'         as title,
    '/a_panels/panel_editor_3.sql' as link;
 select 
    'Retour à la liste des projets'            as title,
    '/e_projects/project_main_display_3.sql'     as link;
 select 
    'Retour au hub du projet'            as title,
    '/e_projects/project_hub_display_3.sql?project_id='||$project_id     as link; 
select 
    'liste des lots de travaux'    as title,
    '/e_project_workpackages/workpackage_main_display_3.sql?project_id='||$project_id as link;
select 
    'Participants au lot de travaux'    as title,
    '/e_project_workpackage_participants/workpackage_participant_main_display_3.sql?workpackage_id='||$workpackage_id as link;

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
    (select workpackage_name  FROM project_workpackages WHERE workpackage_id = $workpackage_id) as value;

select 
    'title'   as component,
    'Ajouter un employé - step 1 : choisir l''entreprise' as contents,
    3         as level;

SELECT 
    'form'      AS component,
    'Choisir l''entreprise' as validate,
    '/e_project_workpackage_participants/workpackage_participant_main_attach3_step1_0.sql?workpackage_id='||$workpackage_id AS action;

select 
   'prm2_sub_id' as name,
    'Choisir l''entreprise employeur' as label,
    'select' as type,
    8 AS width,
    TRUE as searchable,
    'Saisissez quelques lettres du nom que vous cherchez ou choississez dans la liste' as empty_option,
    json_group_array(json_object('label',prm2_sub_name, 'value', prm2_sub_id)) AS options
    FROM (
    SELECT prm2_sub_name, prm2_sub_id
    FROM prm2_sub 
    ORDER BY prm2_sub_name ASC
    );

