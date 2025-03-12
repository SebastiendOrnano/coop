SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
SELECT
    '/c_workspaces/workspace_hub_display_4.sql?workspace_id='||$workspace_id  as link,
    'Retour hub du groupe de travail' as title;

select 
    'button' as component,
    'L'     as size;
select 
    '/c_workspaces/workforum_topic_form_4.sql?workspace_id='||$workspace_id    as link,
    'green'                              as color,
    TRUE                                 as important,
    'Lancer une nouvelle discussion'     as title,
    'arrows-random'                      as icon;
select 
    '/c_workspaces/workforum_topic_archive_4.sql?workspace_id='||$workspace_id    as link,
    'red'                                as color,
    TRUE                                 as important,
    'Discussions archivées'              as title,
    'archive'                            as icon;

SET user_id = (
    SELECT users.user_id AS userID FROM users
    INNER JOIN sessions ON userID = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

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
    (SELECT username FROM users WHERE users.user_id =  t.topic_author_id)    AS 'Contributeur',
    '[Discussion](/c_workspaces/workforum_message_display_4.sql?topic_id='||t.topic_id||'&workspace_id='||$workspace_id||')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Close](/c_workspaces/workforum_close_0.sql?topic_id='||t.topic_id||'&workspace_id='||$workspace_id||')'   AS View
FROM forum_topics AS t
LEFT JOIN (
    SELECT topic_id, MAX(created_at) AS created_at,  message_author_id  
    FROM forum_messages
    GROUP BY topic_id) AS m 
    ON t.topic_id = m.topic_id
WHERE t.topic_status !='archived' AND t.forum_type='forum_wkps' AND t.workspace_id=$workspace_id 
ORDER BY m.created_at DESC;