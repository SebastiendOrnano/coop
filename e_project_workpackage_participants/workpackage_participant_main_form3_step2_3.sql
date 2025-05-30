SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

set project_id = SELECT project_id from project_workpackage where workpackage_id=$workpackage_id;

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
    '/e_project/project_main_display_3.sql'     as link;
 select 
    'Retour au hub du projet'            as title,
    '/e_project/project_hub_display_3.sql?project_id='||$project_id     as link; 
select 
    'liste des lots de travaux'    as title,
    '/e_project_workpackage/workpackage_hub_display_3.sql?project_id='||$project_id as link;
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
    (select workpackage_name  FROM project_workpackage WHERE workpackage_id = $workpackage_id) as value;

select 
    'title'   as component,
    'Ajouter un employé - step 2 : choisir l''employé' as contents,
    3         as level;

-- Form for replying to the topic

SET workpackage_participant_id = SELECT MAX(workpackage_participant_id) FROM project_workpackage_participants WHERE workpackage_id=$workpackage_id;
SET prm2_sub_id = SELECT prm2_sub_id from project_workpackage_participants where workpackage_participant_id = $workpackage_participant_id

SELECT 
    'form'      AS component,
    'Ajouter un employé' as validate,
    '/e_project_workpackage_participants/workpackage_participant_main_attach3_step2_0.sql?workpackage_participant_id='||$workpackage_participant_id||'&workpackage_id='||$workpackage_id AS action;

select 
    'employee_id' as name,
    'Nom de l''employé' as label,
    'select' as type,
    8 AS width,
    TRUE as searchable,
    'Saisissez quelques lettres du nom que vous cherchez ou choississez dans la liste' as empty_option,
    json_group_array(json_object('label',p.prm1_first_name||'  '||p.prm1_last_name, 'value', e.employee_id)) AS options
    FROM prm2_sub_employees as e
    LEFT JOIN (SELECT prm1_id, prm1_first_name, prm1_last_name FROM prm1) as p
    on p.prm1_id = e.prm1_id
    WHERE e.prm2_sub_id = $prm2_sub_id
    ORDER BY p.prm1_last_name ASC;

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