
set project_forum_topic_id= select project_forum_topic_id from project_forum_messages where project_forum_message_id=$project_forum_message_id;
set project_id = select project_id from project_forum_topics where project_forum_topic_id=$project_forum_topic_id;


SET user_role = 
(
    SELECT user_role FROM users
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

UPDATE project_forum_messages 
SET
project_forum_message_content  = :project_forum_message_content,
project_forum_message_status   = :project_forum_message_status,
modified_at=CURRENT_TIMESTAMP
WHERE project_forum_message_id=$project_forum_message_id

RETURNING 
'redirect' AS component, 
$redirect_link AS link;