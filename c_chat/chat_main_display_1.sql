SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_1.sql') AS properties;

select 
    'button' as component,
    'L'     as size;
select 
    '/c_chat/chat_main_form_1.sql'     as link,
    'green'                              as color,
    TRUE                                 as important,
    'Lancer une nouvelle discussion'     as title,
    'arrows-random'                      as icon;


-- Get the last inserted topic ID
SET topic_id = (SELECT MAX(topic_id) FROM forum_topics WHERE topic_name = :topic_name);

SET user_id = (
    SELECT users.user_id FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
);

-- Display list of forum_topics
SELECT 'table' AS component, 
    'Forum forum_topics'   AS title, 
    'View'           AS markdown, 
    TRUE             AS sort, 
    TRUE             AS search;

SELECT       -- NOTE: the dots join values from the forum_topics and forum_messages tables
    t.topic_id                 AS ID,
    t.topic_name               AS Topic,
    t.topic_category           AS 'Categorie',
    m.created_at               AS 'Posté le',
    CASE
    WHEN m.message_author_id =$user_id THEN ''
    ELSE (SELECT username||'   ('||user_id||')' from users WHERE user_id=m.message_author_id) 
    END       as auteur,
    CASE
     WHEN m.message_recipient_id =$user_id THEN ''
    ELSE (SELECT username||'   ('||user_id||')' from users WHERE user_id=m.message_recipient_id)  
    END    as destinataire,
    '[Discussion](/c_chat/chat_message_display_1.sql?topic_id=' || t.topic_id || ')'    AS View
FROM forum_topics AS t
LEFT JOIN (
    SELECT topic_id, MAX(created_at) AS created_at,  message_author_id, message_recipient_id  
    FROM forum_messages
    GROUP BY topic_id) AS m 
    ON t.topic_id = m.topic_id
WHERE t.topic_status !='archived' AND t.forum_type='chat' AND (m.message_author_id =$user_id OR m.message_recipient_id =$user_id)
/*AND t.chat_group=$user_group */
ORDER BY m.created_at DESC;