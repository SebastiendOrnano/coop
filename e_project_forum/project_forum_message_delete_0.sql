SET project_forum_topic_id=(SELECT project_forum_topic_id FROM project_forum_messages WHERE project_forum_message_id=$project_forum_message_id);

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/e_project_forum/project_forum_message_display_4.sql?project_forum_topic_id='||$project_forum_topic_id
ELSE '/e_project_forum/project_forum_message_display_3.sql?project_forum_topic_id='|$project_forum_topic_id
END;

DELETE FROM project_forum_messages WHERE project_forum_message_id = $project_forum_message_id

RETURNING 
'redirect' AS component, 
$redirect_link AS link;