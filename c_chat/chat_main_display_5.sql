SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_5.sql') AS properties;


-- Get the last inserted topic ID
SET topic_id = (SELECT MAX(topic_id) FROM forum_topics WHERE topic_name = :topic_name);


-- Display list of forum_topics
SELECT 'table' AS component, 
    'Forum forum_topics'   AS title, 
    'View'                 AS markdown, 
    TRUE                   AS sort, 
    TRUE                   AS search;

SELECT       -- NOTE: the dots join values from the forum_topics and forum_messages tables
   --  t.chat_group                AS G, (if group filter is actived)
    t.topic_id                   AS ID,
    t.topic_name                 AS Topic,
    t.topic_status               AS Statut,
    t.topic_category             AS 'Categorie',
    m.created_at                 AS 'Posté le',
    t.number_messages             AS Nb,
   (SELECT username FROM users WHERE users.user_id =  topic_author_id)   AS 'Contributeur',
    '[Discussion](/c_chat/chat_message_display_5.sql?topic_id=' || t.topic_id ||  ')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Edit](/c_chat/chat_main_edit_5.sql?topic_id=' || t.topic_id ||')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Delete](/c_chat/chat_main_delete_alert1_5.sql?topic_id=' || t.topic_id ||')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Close](/c_chat/chat_main_close_0.sql?topic_id=' || t.topic_id ||')'    AS View
FROM forum_topics AS t
LEFT JOIN (
    SELECT topic_id, MAX(created_at) AS created_at FROM forum_messages
    GROUP BY topic_id) AS m 
    ON t.topic_id = m.topic_id
WHERE  t.topic_status !='archived' AND t.forum_type='forum'
ORDER BY t.topic_status DESC, m.created_at DESC;