
set project_id = select project_id from project_forum_topics where project_forum_topic_id=$project_forum_topic_id;


UPDATE project_forum_topics
SET
project_forum_topic_status='active',
modified_at=CURRENT_TIMESTAMP
WHERE project_forum_topic_id=$project_forum_topic_id

RETURNING 
'redirect' AS component, 
'/e_project_forum/project_forum_main_display_4.sql?project_id='||$project_id AS link;