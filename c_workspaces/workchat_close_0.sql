SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/c_workspaces/workchat_display_4.sql?workspace_id='||$workspace_id
ELSE '/c_workspaces/workchat_display_3.sql?workspace_id='||$workspace_id
END;


UPDATE forum_topics
SET
topic_status='closed',
modified_at=CURRENT_TIMESTAMP
WHERE topic_id=$topic_id

RETURNING 
'redirect' AS component, 
$redirect_link AS link;