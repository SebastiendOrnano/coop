SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET workpackage_id = select workpackage_id from project_worksequences where worksequence_id=$worksequence_id;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion superviseur'         as title,
    '/a_panels/panel_supervisor_4.sql' as link;
select 
    'Gestion des séquences'            as title,
    '/e_project_worksequences/worksequence_main_display_4.sql?workpackage_id='||$workpackage_id as link;
select 
    'Gestion des participants à la séquence'            as title,
    '/e_project_worksequence_participants/worksequence_participant_main_display_4.sql?worksequence_id='||$worksequence_id  as link;

SELECT 
    'form' as component,
    '' as validate;
select 
    'worksequence_id' as name,
    'hidden' as type,
    $worksequence_id as value,
    'id' as label;
SELECT
    'worksequence_name' as name,
    TRUE as readonly,
    'Nom de la séquence de travail' as label,
     6 as width,
    (select worksequence_name  FROM project_worksequences WHERE worksequence_id = $worksequence_id) as value;

select 
    'title'   as component,
    'Ajouter une personne morale' as contents,
    3         as level;

-- Form for replying to the topic

SELECT 
    'form'      AS component,
    'Ajouter un employé' as validate,
    '/e_project_worksequence_participants/worksequence_participant_main_attach2_0.sql?worksequence_id='||$worksequence_id AS action;

select 
   'prm2_sub_id' as name,
    'Nom de l''empoyé' as label,
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

 SELECT 
    'worksequence_participant_role'            as name,
    'Rôle dans le groupement'    as label,
    'select'                       as type,
    4                              AS width,
    'Choisir un rôle...'           as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="worksequence_role"
    ORDER BY  i.choice_label ASC;