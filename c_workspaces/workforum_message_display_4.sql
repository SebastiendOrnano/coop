SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_4.sql') AS properties;

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

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
    '/c_workspaces/workspace_hub_display_4.sql?workspace_id='||$workspace_id  as link,
    'Retour hub du groupe de travail' as title;
select 
    'Retour à la liste des discussions'            as title,
    '/c_workspaces/workforum_display_4.sql?workspace_id='||$workspace_id  as link;

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


SET message_id = (SELECT MAX(message_id) FROM forum_messages WHERE topic_id = $topic_id);

SET doc_link = 
CASE WHEN (SELECT workdoc_url from workdocs where message_id=$message_id) IS NOT NULL OR  (SELECT workdoc_url from workdocs where message_id=$message_id) !=""
THEN  concat('http://localhost:8080/', (SELECT workdoc_url from workdocs where message_id=$message_id) )
ELSE ''
END;

SET doc_title = 
CASE WHEN (SELECT workdoc_url from workdocs where message_id=$message_id) IS NOT NULL OR  (SELECT workdoc_url from workdocs where message_id=$message_id) !=""
THEN 'Télécharger le document attaché' 
ELSE 'Pas de fichier attaché'
END;

SET doc_icon = 
CASE WHEN (SELECT workdoc_url from workdocs where message_id=$message_id) IS NOT NULL OR  (SELECT workdoc_url from workdocs where message_id=$message_id) !=""
THEN 'download'
ELSE ''
END;

SET doc_color = 
CASE WHEN (SELECT workdoc_url from workdocs where message_id=$message_id) IS NOT NULL OR  (SELECT workdoc_url from workdocs where message_id=$message_id) !=""
THEN 'green'
ELSE 'red'
END;

select 
    'button' as component;
select 
    $doc_link     as link,
    $doc_icon as icon,
    $doc_color  as color,
    $doc_title as title,
    'Download' as tooltip;

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
    m.message_id              AS Id,
    m.created_at             AS 'Posted At',
    (SELECT users.username FROM users WHERE users.user_id = m.message_author_id )  AS Author,
    m.message_content        AS Message,
    '[Doc]('||d.workdoc_url||')' AS View   
FROM forum_messages AS m
LEFT JOIN (
    SELECT message_id, workdoc_url 
    FROM workdocs ) as d
    ON d.message_id = m.message_id
    WHERE m.topic_id=$topic_id
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
 '/c_workspaces/workforum_message_create_0.sql?topic_id='||$topic_id||'&workspace_id='||$workspace_id AS action;

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
