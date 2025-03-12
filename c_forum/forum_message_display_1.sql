SET  topic_status= SELECT topic_status FROM  forum_topics WHERE topic_id = $topic_id ;

SELECT 'redirect' as component,
'/c_debug/debug_message_close_display_1.sql?topic_id='||$topic_id AS link 
WHERE $topic_status='closed';

SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_1.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;

select 
    'Liste des discussions'               as title,
    '/c_forum/forum_main_display_1.sql'   as link;

-- Display forum_messages for the selected topic

select 
    'divider'              as component,
    'Message initial'      as contents,
    'left'                 as position,  
    4                      as size,
    'black'                as color;

SELECT
    'form' as component,
    '' as validate;

SELECT
    'topic_name' as name,
    'Titre du message initial' as label,
     7 as width,
    (SELECT topic_name FROM forum_topics WHERE topic_id=$topic_id)  as value;

SELECT
    'topic_author' as name,
    'Discussion lancée par : ' as label,
    3 as width,
    (SELECT username FROM users AS u INNER JOIN forum_topics as f ON u.user_id = f.topic_author_id where f.topic_id=$topic_id) as value; 

SELECT
    'created_at' as name,
    'le : ' as label,
    2 as width,
    (SELECT m.created_at FROM forum_topics AS t 
    LEFT JOIN  (SELECT topic_id, created_at  FROM forum_messages)  AS m
    ON t.topic_id = m.topic_id
    where t.topic_id=$topic_id)
    as value; 

SELECT
    'text'             as component,
    'forum_message_md' as id,
    (SELECT m.message_content FROM forum_topics AS t 
    LEFT JOIN  (SELECT topic_id, message_content  FROM forum_messages)  AS m
    ON t.topic_id = m.topic_id
    where t.topic_id=$topic_id)
    as contents_md; 

SET username = (
    SELECT users.username FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SELECT
    'divider'              as component,
    'Réponses'             as contents,
    'left'                 as position,  
    4                      as size,
    'black'                as color;

SELECT 
    'table'                      AS component, 
    'Message'                    AS markdown,
    'View'                       AS markdown,
    TRUE                         AS sort, 
    TRUE                         AS search;

SELECT
    created_at             AS 'Posted At',
    (SELECT users.username FROM users WHERE users.user_id = message_author_id )  AS Author,
    message_content        AS Message,
    CASE
    WHEN (SELECT users.username FROM users WHERE users.user_id = message_author_id )  = $username
    THEN (SELECT '[Edit](/c_forum/forum_message_edit_1.sql?message_id='||message_id||') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
[Delete](/c_forum/forum_message_delete_0.sql?message_id='||message_id||')') 
    ELSE ''
    END AS View   
FROM forum_messages
WHERE topic_id = $topic_id AND message_rank!='main'
ORDER BY created_at ASC;

select 
    'divider'              as component,
    'Votre contribution'   as contents,
    'left'                 as position,  
    4                      as size,
    'green'                as color;

-- Form for replying to the topic
SELECT 'form'      AS component,
 'Envoyer'         as validate,
 'Clear'           as reset,
 '/c_debug/debug_message_create_0.sql?topic_id='||$topic_id AS action;

SELECT 
'message_content'                  AS name, 
'textarea'                         as type, 
'Votre contribution'               as label,
'Vous pouvez rédiger en markdown'  as description,
TRUE                               as required;
