SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'admin' 
THEN '/c_debug/debug_message_display_5.sql?topic_id='||$topic_id
ELSE '/c_debug/debug_message_display_1.sql?topic_id='|$topic_id
END;

SET message_author_id = (
    SELECT users.user_id FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

INSERT INTO forum_messages 
(
topic_id, 
message_author_id,
message_content,
message_status
)
SELECT 
$topic_id, 
$message_author_id, 
:message_content,
'online'
WHERE :message_content IS NOT NULL;

UPDATE forum_topics
SET
number_messages = number_messages +1,
modified_at = CURRENT_TIMESTAMP
WHERE topic_id=$topic_id

RETURNING 
'redirect' AS component, 
$redirect_link AS link;