SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/e_project_forum/project_forum_main_display_4.sql?project_id='||$project_id 
ELSE '/e_project_forum/project_forum_main_display_3.sql?project_id='||$project_id 
END;

UPDATE project_forum_topics
SET
project_forum_topic_name=:project_forum_topic_name, 
project_forum_topic_category=:project_forum_topic_category,
project_forum_topic_status=:project_forum_topic_status,
modified_at=CURRENT_TIMESTAMP
WHERE project_forum_topic_id=$project_forum_topic_id;

UPDATE project_forum_messages 
SET
project_forum_message_content=:project_forum_message_content
WHERE project_forum_topic_id=$project_forum_topic_id

RETURNING 
'redirect' AS component, 
$redirect_link AS link;