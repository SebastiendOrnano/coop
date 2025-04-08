SET project_forum_topic_id=(SELECT project_forum_topic_id FROM project_forum_messages WHERE project_forum_message_id=$project_forum_message_id);


UPDATE project_forum_messages
SET
project_forum_message_status='archived',
modified_at=CURRENT_TIMESTAMP
WHERE project_forum_message_id=$project_forum_message_id

RETURNING 
'redirect' AS component, 
'/e_project_forum/project_forum_message_display_4.sql?project_forum_topic_id='||$project_forum_topic_id AS link;