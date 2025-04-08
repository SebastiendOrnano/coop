SET  project_forum_topic_status= SELECT project_forum_topic_status FROM  project_forum_topics WHERE project_forum_topic_id = $project_forum_topic_id ;
set project_id = select project_id from project_forum_topics WHERE project_forum_topic_id = $project_forum_topic_id ;


SELECT 'redirect' as component,
'/e_project_forum/project_forum_message_close_display_3.sql?project_forum_topic_id='||$project_forum_topic_id AS link 
WHERE $project_forum_topic_status='closed';

SELECT 'dynamic' AS component, sqlpage.run_sql('a_shells/shell_3.sql') AS properties;

select 
    'breadcrumb' as component;
select 
    'Home' as title,
    '/'    as link;
select 
    'Gestion éditeur'         as title,
    '/a_panels/panel_editor_3.sql' as link;
 select 
    'Retour à la liste des projets'            as title,
    '/e_project/project_main_display_3.sql'     as link;   
 select 
    'Retour au hub du projet'            as title,
    '/e_project/project_hub_display_3.sql?project_id='||$project_id     as link;
 select 
    'Liste des discussion en cours'            as title,
    '/e_project_forum/project_forum_main_display_3.sql?project_id='||$project_id     as link;
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
    project_forum_message_id             AS Id,
    created_at             AS 'Posted At',
    (SELECT users.username FROM users WHERE users.user_id = project_forum_message_author_id )  AS Author,
    project_forum_message_content        AS Message
FROM project_forum_messages
WHERE project_forum_topic_id = $project_forum_topic_id AND project_forum_message_rank!='main'
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
 '/e_project_forum/project_forum_message_create_0.sql?project_forum_topic_id='||$project_forum_topic_id AS action;

SELECT 
'project_forum_message_content'                  AS name, 
'textarea'                         as type, 
'Votre contribution'               as label,
'Vous pouvez rédiger en markdown'  as description,
TRUE                               as required;