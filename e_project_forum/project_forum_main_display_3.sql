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
    'datagrid'              as component,
    'panel_project_meeting_display' as id,
    'Gestion des réunions du projet :  '|| $project_name as title;
select 
    '/e_project_forum/project_forum_main_form_3.sql?project_id='||$project_id          as link,
    'Lancer une nouvelle discussion'          as description,
    'arrows-random'                                    as icon,
    'yellow'                                   as color;

-- Get the last inserted topic ID
SET project_forum_topic_id = (SELECT MAX(project_forum_topic_id) FROM project_forum_topics WHERE project_forum_topic_name = :project_forum_topic_name);

-- Display list of project_forum_topics
SELECT 'table' AS component, 
    'Forum project_forum_topics'   AS title, 
    'View'           AS markdown, 
    TRUE             AS sort, 
    TRUE             AS search;

SELECT       -- NOTE: the dots join values from the project_forum_topics and project_forum_messages tables
    t.project_forum_topic_id       AS ID,
    t.project_forum_topic_name     AS Topic,
    t.project_forum_topic_category AS 'Categorie',
    m.created_at     AS 'Posté le',
    (SELECT username FROM users WHERE users.user_id =  project_forum_topic_author_id)    AS 'Contributeur',
    '[Discussion](/e_project_forum/project_forum_message_display_3.sql?project_forum_topic_id=' || t.project_forum_topic_id || ')'    AS View
FROM project_forum_topics AS t
LEFT JOIN (
    SELECT project_forum_topic_id, MAX(created_at) AS created_at,  project_forum_message_author_id  
    FROM project_forum_messages
    GROUP BY project_forum_topic_id) AS m 
    ON t.project_forum_topic_id = m.project_forum_topic_id
WHERE t.project_forum_topic_status !='archived' AND t.forum_type='forum' 
ORDER BY m.created_at DESC;