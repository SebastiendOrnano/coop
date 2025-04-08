DELETE FROM project_forum_messages 
WHERE project_forum_topic_id = $project_forum_topic_id;

DELETE FROM project_forum_topics 
WHERE project_forum_topic_id = $project_forum_topic_id

RETURNING
   'redirect' AS component,
   '/e_project_forum/project_forum_main_display_4.sql' as link;