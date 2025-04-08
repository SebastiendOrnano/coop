SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;


set project_id = select project_id from project_forum_topics where project_forum_topic_id=$project_forum_topic_id;


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
    'Liste des discussion en cours'            as title,
    '/e_project_forum/project_forum_main_display_4.sql?project_id='||$project_id     as link;


-- Form for adding a new topic and initial message
select 
    'form'  as component, 
    'Actualiser le sujet initial d''une discussion'  as title,
    'Valider'                           as validate,
    'Clear'                              as reset,
    '/e_project_forum/project_forum_main_update_0.sql?project_forum_topic_id='||$project_forum_topic_id as action;

SELECT 
    'Sujet'             as label,
    'project_forum_topic_name'        AS name,
    'text'              as type, 
    'Enter topic title' AS placeholder, 
    (select project_forum_topic_name from project_forum_topics where project_forum_topic_id=$project_forum_topic_id) as value,
    TRUE as required;

SELECT 
    'project_forum_topic_status'            as name,
    'Statut'                 as label,
    'select'                    as type,
    TRUE                        as required,
    4                           AS width,
    (select project_forum_topic_status from project_forum_topics where project_forum_topic_id=$project_forum_topic_id) as value,
    'Choisir un statut dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status"
    ORDER BY  i.choice_label ASC;



SELECT 
    'project_forum_topic_category'            as name,
    'Categorie'                 as label,
    'select'                    as type,
    TRUE                        as required,
    4                           AS width,
    (select project_forum_topic_category from project_forum_topics where project_forum_topic_id=$project_forum_topic_id) as value,
    'Choisir une catégorie dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="topic_category"
    ORDER BY  i.choice_label ASC;


SELECT 
    'project_forum_message_content'  AS name, 
    'Votre message'  as label,
    'textarea'       as type, 
    'Your message' AS placeholder,
    (select project_forum_message_content from project_forum_messages where project_forum_topic_id=$project_forum_topic_id and project_forum_message_rank='main') as value,
    'Vous pouvez rédiger en markdown !' as description,
    TRUE as required;
