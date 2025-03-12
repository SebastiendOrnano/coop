SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion Admin'         as title,
    '/a_panels/panel_admin_5.sql' as link;
select 
    'Gestion forum'         as title,
    '/c_debug/debug_main_display_5.sql' as link;



-- Form for adding a new topic and initial message
select 
    'form'  as component, 
    'FORUM : actualiser une discussion'          as title,
    'Actualiser le sujet initial d''une discussion'                           as validate,
    'Clear'                              as reset,
    '/c_debug/debug_main_update_0.sql?topic_id='||$topic_id  as action;

SELECT 
    'Sujet'             as label,
    'topic_name'        AS name,
    'text'              as type, 
    (SELECT topic_name FROM forum_topics WHERE topic_id=$topic_id) as value,
    'Enter topic title' AS placeholder,
    TRUE                as required;

SELECT 
    'topic_status'                          as name,
    'Statut de publication'                 as label,
    'select'                                as type,
    (select topic_status FROM forum_topics WHERE topic_id=$topic_id) as value,
    TRUE                     as required,
    2                        AS width,
    'Choisir un statut dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status_publication"
    ORDER BY  i.choice_label ASC;

SELECT 
    'topic_category'            as name,
    'Categorie'                 as label,
    'select'                 as type,
    (select  topic_category FROM forum_topics WHERE topic_id=$topic_id) as value,
    TRUE                     as required,
    2                        AS width,
    'Choisir une catégorie dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="debug_category"
    ORDER BY  i.choice_label ASC;

SELECT 
    'debug_target'  AS name, 
    'Module-Table concerné'  as label,
    'textarea'       as type, 
    'Your message' AS placeholder, 
    (SELECT debug_target FROM forum_topics WHERE topic_id=$topic_id) as value,
    TRUE as required;


SELECT 
    'message_content'      AS name, 
    'Contenu du  message'  as label,
    'textarea'              as type,
    (SELECT message_content FROM forum_messages WHERE topic_id=$topic_id) as value,
    TRUE as required;




