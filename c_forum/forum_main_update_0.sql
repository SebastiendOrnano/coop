SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'admin' 
THEN '/c_forum/forum_main_display_5.sql'
ELSE '/c_forum/forum_main_display_1.sql'
END;

UPDATE forum_topics
SET
topic_name=:topic_name, 
topic_category=:topic_category,
topic_status=:topic_status,
modified_at=CURRENT_TIMESTAMP
WHERE topic_id=$topic_id;

UPDATE forum_messages 
SET
message_content=:message_content
WHERE topic_id=$topic_id

RETURNING 
'redirect' AS component, 
$redirect_link AS link;