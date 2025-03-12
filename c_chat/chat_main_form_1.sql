SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_1.sql') AS properties;


-- Form for adding a new topic and initial message
select 
    'form'  as component, 
    'Lancer une discussion'  as title,
    'Valider'                           as validate,
    'Clear'                              as reset,
    '/c_chat/chat_main_create_0.sql'  as action;

select 
   'message_recipient_id' as name,
    'Destinataire' as label,
    'select' as type,
    6 AS width,
    TRUE as searchable,
    TRUE as required,
    'Saisissez quelques lettres du nom que vous cherchez ou choississez dans la liste' as empty_option,
    json_group_array(json_object('label', username || '   (' || user_id|| ')   ' || user_last_name, 'value', user_id)) AS options
    FROM (
    SELECT username, user_first_name, user_last_name, user_id
    FROM users
    ORDER BY user_last_name ASC, user_first_name ASC
    );

SELECT 
    'Sujet'             as label,
    'topic_name'        AS name,
    'text'              as type, 
    'Enter topic title' AS placeholder, 
    TRUE as required;

SELECT 
    'message_content'  AS name, 
    'Votre message'  as label,
    'textarea'       as type, 
    'Your message' AS placeholder,
    'Vous pouvez rédifer en markdown !' as description,
    TRUE as required;
