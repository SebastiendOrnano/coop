UPDATE project_forum_topics
SET
project_forum_topic_status='closed',
modified_at=CURRENT_TIMESTAMP
WHERE project_forum_topic_id=$project_forum_topic_id

RETURNING 
'redirect' AS component, 
'/e_project_forum/project_forum_main_display_4.sql' AS link;