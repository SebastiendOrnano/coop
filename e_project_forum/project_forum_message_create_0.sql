-- Insert reply message if topic ID is valid

SET author = (
    SELECT users.username FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/e_project_forum/project_forum_message_display_4.sql?project_forum_topic_id='||$project_forum_topic_id
ELSE '/e_project_forum/project_forum_message_display_3.sql?project_forum_topic_id='||$project_forum_topic_id
END;

SET project_forum_message_author_id = (
    SELECT users.user_id FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 


INSERT INTO project_forum_messages 
(
project_forum_topic_id, 
project_forum_message_author_id,
project_forum_message_content,
project_forum_message_status
)
SELECT 
$project_forum_topic_id, 
$project_forum_message_author_id, 
:project_forum_message_content,
'active'
WHERE :project_forum_message_content IS NOT NULL;

UPDATE project_forum_topics
SET
number_messages = number_messages +1,
modified_at = CURRENT_TIMESTAMP
WHERE project_forum_topic_id=$project_forum_topic_id

RETURNING 
'redirect' AS component, 
$redirect_link AS link;