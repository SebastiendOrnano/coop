SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/c_workspaces/workforum_display_4.sql'
ELSE '/c_workspaces/workforum_display_3.sql'
END;

SET from_id = (
    SELECT users.user_id FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
SELECT
    '/c_workspaces/workspace_hub_display_3.sql?workspace_id='||$workspace_id  as link,
    'Retour hub du groupe de travail' as title;
select 
    'Retour liste messages'            as title,
    '/c_workspaces/workforum_display_3.sql?workspace_id='||$workspace_id  as link;

-- Display forum_messages for the selected topic

select 
    'divider'              as component,
    'Message initial33'      as contents,
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
    'chat_message_md' as id,
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
    THEN (SELECT '[Edit](/c_chat/chat_message_edit_3.sql?message_id='||message_id||') &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
[Delete](/c_chat/chat_message_delete_0.sql?message_id='||message_id||')') 
    ELSE ''
    END AS View   
FROM forum_messages
WHERE topic_id = $topic_id AND message_rank!='main'
ORDER BY created_at ASC;

SET topic_status= SELECT topic_status FROM  forum_topics WHERE topic_id = $topic_id ;

SET closed_discussion1 =
CASE
WHEN $topic_status='closed'  THEN 'Cette discussion est clôturée.'
ELSE 'Votre réponse'
END;

SET closed_discussion2 =
CASE
WHEN $topic_status='closed'  THEN ''
ELSE 'Envoyer'
END;

SET closed_discussion3 =
CASE
WHEN $topic_status='closed'  THEN 'hidden'
ELSE 'textarea'
END;

SELECT
    'divider'              as component,
    $closed_discussion1    as contents,
    'left'                 as position,  
    4                      as size,
    'green'                as color;


-- Form for replying to the topic

SELECT 'form'      AS component,
    $closed_discussion2 as validate,
    '/c_workspaces/workchat_message_create_0.sql?topic_id='||$topic_id||'&workspace_id='||$workspace_id AS action;

SELECT 
    'message_content'                  AS name, 
    $closed_discussion3                as type, 
    'Votre réponse'                    as label,
    'vous pouvez rédiger en markdown'  as description,
    TRUE                               as required;

select 
    'file' as type, 
    'workdoc_url' as name,
    'Document à partager' as label,
    'size max : 5 MB' as description,
    '*'  as accept;
