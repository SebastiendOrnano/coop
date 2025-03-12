SET topic_id=(SELECT topic_id FROM forum_messages WHERE message_id=$message_id);

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'admin' 
THEN '/c_forum/forum_message_display_5.sql?topic_id='||$topic_id
ELSE '/c_forum/forum_message_display_1.sql?topic_id='|$topic_id
END;

DELETE FROM forum_messages WHERE message_id = $message_id

RETURNING 
'redirect' AS component, 
$redirect_link AS link;