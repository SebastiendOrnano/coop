SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

SELECT 
    'text'             as component,
    $author as contents_md;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Liste des discussions'               as title,
    '/e_project_forum/project_forum_main_display_3.sql'   as link;

-- Display project_forum_messages for the selected topic

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
    'project_forum_topic_name' as name,
    'Titre du message initial' as label,
     7 as width,
    (SELECT project_forum_topic_name FROM project_forum_topics WHERE project_forum_topic_id=$project_forum_topic_id)  as value;

SELECT
    'project_forum_topic_author' as name,
    'Discussion lancée par : ' as label,
    3 as width,
    (SELECT username FROM users AS u INNER JOIN project_forum_topics as f ON u.user_id = f.project_forum_topic_author_id where f.project_forum_topic_id=$project_forum_topic_id) as value; 

SELECT
    'created_at' as name,
    'le : ' as label,
    2 as width,
    (SELECT m.created_at FROM project_forum_topics AS t 
    LEFT JOIN  (SELECT project_forum_topic_id, created_at  FROM project_forum_messages)  AS m
    ON t.project_forum_topic_id = m.project_forum_topic_id
    where t.project_forum_topic_id=$project_forum_topic_id)
    as value; 

SELECT
    'text'             as component,
    'project_forum_message_md' as id,
    (SELECT m.project_forum_message_content FROM project_forum_topics AS t 
    LEFT JOIN  (SELECT project_forum_topic_id, project_forum_message_content  FROM project_forum_messages)  AS m
    ON t.project_forum_topic_id = m.project_forum_topic_id
    where t.project_forum_topic_id=$project_forum_topic_id)
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
    (SELECT users.username FROM users WHERE users.user_id = project_forum_message_author_id )  AS Author,
    project_forum_message_content        AS Message,
    CASE
    WHEN (SELECT users.username FROM users WHERE users.user_id = project_forum_message_author_id )  = $username
    THEN (SELECT '[Edit](/e_project_forum/project_forum_message_edit_1.sql?project_forum_message_id='||project_forum_message_id||') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
[Delete](/e_project_forum/project_forum_message_delete_0.sql?project_forum_message_id='||project_forum_message_id||')') 
    ELSE ''
    END AS View   
FROM project_forum_messages
WHERE project_forum_topic_id = $project_forum_topic_id AND project_forum_message_rank!='main'
ORDER BY created_at ASC;

select 
    'divider'              as component,
    'Cette discussion est clôturée.'    as contents,
    'left'                 as position,  
    4                      as size,
    'green'                as color;

select 
    'button' as component,
    'L'     as size;
select 
    '/e_project_forum/project_forum_main_display_3.sql'         as link,
    'green'                                     as color,
    TRUE                                        as important,
    'Retour à la liste des discussions'         as title,
    'arrows-random'                             as icon;
