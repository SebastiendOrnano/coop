SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;

SELECT 
    'form'                  AS component,
    'actualiser le message' as validate,
    'clear'                 as reset,
    '/c_debug/debug_message_update_0.sql?message_id='||$message_id AS action;

SELECT 
    'message_content'           AS name, 
    'textarea'                        as type, 
    (SELECT message_content FROM forum_messages WHERE message_id=$message_id) as value,
    'Contenu de la contribution'    as label,
    TRUE                               as required;


SELECT 
    'message_content'  AS name, 
    'Contenu du message'  as label,
    'textarea'       as type, 
    'Your message' AS placeholder, 
    (SELECT message_content  FROM forum_messages WHERE message_id=$message_id) as value,
    TRUE as required;

SELECT 
    'message_status'            as name,
    'Statut de publication'    as label,
    'select'                 as type,
    (select message_status FROM forum_messages WHERE  message_id=$message_id) as value,
    TRUE                     as required,
    2                        AS width,
    'Choisir un statut dans la liste...'    as empty_option,
    json_group_array(json_object('label',i.choice_label, 'value', i.choice_value))  AS options
    FROM choices_items AS i
    LEFT JOIN (select choice_category_id, choice_category_name from choices_categories)  AS c 
    ON i.choice_category_id = c.choice_category_id
    where choice_category_name="status_publication"
    ORDER BY  i.choice_label ASC;




