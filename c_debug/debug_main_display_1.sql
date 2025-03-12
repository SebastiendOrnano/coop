SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_1.sql') AS properties;

select 
    'button' as component,
    'L'     as size;
select 
    '/c_debug/debug_main_form_1.sql'     as link,
    'green'                               as color,
    TRUE                                 as important,
    'Signaler un bug ou faire une demande d''amélioration de la plateforme'  as title,
    'bug'                                  as icon;


-- Get the last inserted topic ID
SET topic_id = (SELECT MAX(topic_id) FROM forum_topics WHERE topic_name = :topic_name);

-- Display list of forum_topics
SELECT 'table' AS component, 
    'Forum forum_topics'   AS title, 
    'View'           AS markdown, 
    TRUE             AS sort, 
    TRUE             AS search;

SELECT       -- NOTE: the dots join values from the forum_topics and forum_messages tables
    t.topic_id       AS ID,
    t.topic_name     AS Topic,
    t.topic_category AS 'Categorie',
    m.created_at     AS 'Posté le',
    (SELECT username FROM users WHERE users.user_id =  topic_author_id)    AS 'Contributeur',
    '[Discussion](/c_debug/debug_message_display_1.sql?topic_id=' || t.topic_id || ')'    AS View
FROM forum_topics AS t
LEFT JOIN (
    SELECT topic_id, MAX(created_at) AS created_at,  message_author_id  
    FROM forum_messages
    GROUP BY topic_id) AS m 
    ON t.topic_id = m.topic_id
WHERE t.topic_status !='archived' AND t.forum_type='debug' 
ORDER BY m.created_at DESC;