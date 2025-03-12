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
    'Gestion des groupements'            as title,
     '/d_prm3/prm3_main_display_4.sql' as link;
select 
    'Participants du groupement'            as title,
    '/d_prm3_participants/prm3_participant_main_display_4.sql?prm3_id='||$prm3_id  as link;


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
    'Ajouter une personne morale' as contents,
    3         as level;

-- Form for replying to the topic

SELECT 
    'form'      AS component,
    'Ajouter une entreprise' as validate,
    '/d_prm3_participants/prm3_participant_main_attach2_0.sql?prm3_id='||$prm3_id AS action;

select 
   'prm2_sub_id' as name,
    'Nom de l''entreprise ou l''organisation' as label,
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