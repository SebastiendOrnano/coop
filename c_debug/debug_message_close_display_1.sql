SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_1.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Liste des discussions'            as title,
    '/c_debug/debug_main_display_5.sql'   as link;

select 
    'divider'              as component,
    'Message initial'             as contents,
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

SELECT
    'divider'              as component,
    'Réponses'             as contents,
    'left'                 as position,  
    4                      as size,
    'black'                as color;

SELECT 
    'table'                      AS component, 
    'Message'                    AS markdown,
    TRUE                         AS sort, 
    TRUE                         AS search;

SELECT
    message_id             AS Id,
    created_at             AS 'Posted At',
    (SELECT users.username FROM users WHERE users.user_id = message_author_id )  AS Author,
    message_content        AS Message 
FROM forum_messages
WHERE topic_id = $topic_id AND message_rank!='main'
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
    '/c_debug/debug_main_display_1.sql'    as link,
    'green'                                as color,
    TRUE                                   as important,
    'Retour à la liste des discussions'    as title,
    'arrows-random'                        as icon;


