SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'admin' 
THEN '/c_debug/debug_main_display_5.sql'
ELSE '/c_debug/debug_main_display_1.sql'
END;

SET topic_author_id = (
    SELECT users.user_id FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
);

-- Insert new topic
INSERT INTO forum_topics
(
topic_author_id,
topic_name, 
topic_category,
debug_target,
topic_status,
forum_type
)
SELECT
$topic_author_id,
:topic_name, 
:topic_category,
:debug_target,
'online',
'debug'
WHERE :topic_name IS NOT NULL;

-- Get the last inserted topic ID

SET topic_id = (SELECT MAX(topic_id) FROM forum_topics WHERE topic_name = :topic_name);

-- Insert initial message if topic ID is valid
 

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
message_status,
message_rank
)
SELECT 
$topic_id,
$message_author_id, 
:message_content,
'online',
'main'

WHERE :message_content IS NOT NULL OR :message_content!=''

RETURNING 
'redirect' AS component, 
$redirect_link AS link;