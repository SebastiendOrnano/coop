SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion editeur'         as title,
    '/a_panels/panel_editor_3.sql' as link;
select 
    'Gestion des groupements'            as title,
    '/d_prm3/prm3_main_display_3.sql' as link;
select 
    'Participants du groupement'            as title,
    '/d_prm3_participants/prm3_participant_main_display_3.sql?prm3_id='||$prm3_id  as link;


select 
    'title'     as component,
    'Groupement'    as contents,
    3           as level;

SELECT 
    'form' as component,
    '' as validate;

select 
    'prm3_id' as name,
    'hidden' as type,
    $prm3_id as value,
    'id' as label;


SELECT
    'prm3_name' as name,
    TRUE as readonly,
    'Nom du groupe' as label,
     6 as width,
    (select prm3_name  FROM prm3 WHERE prm3_id = $prm3_id) as value;

select 
    'alert'     as component,
    'Création d''un nouveau praticipant' as title,
     TRUE              as important,
    TRUE              as dismissible,
'Pour ajouter une personne morale : entreprises, association, collectivité...' as description_md,
'red' as color;

select 
    'title'   as component,
    'Ajouter un employé d''une personne morale' as contents,
    3         as level;

-- Form for replying to the topic

SET prm3_participant_id = SELECT MAX(prm3_participant_id) FROM prm3_participants WHERE prm3_id=$prm3_id;
SET prm2_sub_id = SELECT prm2_sub_id from prm3_participants where prm3_participant_id = $prm3_participant_id

SELECT 
    'form'      AS component,
    'Ajouter un employé' as validate,
    '/d_prm3_participants/prm3_participant_main_attach3_step2_0.sql?prm3_participant_id='||$prm3_participant_id||'&prm3_id='||$prm3_id AS action;

select 
    'employee_id' as name,
    'Nom de l''employé' as label,
    'select' as type,
    8 AS width,
    TRUE as searchable,
    'Saisissez quelques lettres du nom que vous cherchez ou choississez dans la liste' as empty_option,
    json_group_array(json_object('label',p.prm1_first_name, 'value', e.employee_id)) AS options
    FROM prm2_sub_employees as e
    LEFT JOIN (SELECT prm1_id, prm1_first_name, prm1_last_name FROM prm1) as p
    on p.prm1_id = e.prm1_id
    WHERE e.prm2_sub_id = $prm2_sub_id
    ORDER BY p.prm1_last_name ASC;

 SELECT 
    'prm3_participant_role'            as name,
    'Rôle dans le groupement'    as label,
    'select'                       as type,
    4                              AS width,
    'Choisir un rôle...'           as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="prm3_role"
    ORDER BY  i.choice_label ASC;