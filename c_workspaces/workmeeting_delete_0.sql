SET user_id = (
    SELECT users.user_id AS UserId FROM users
    INNER JOIN sessions ON sessions.user_id = UserId
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

set workspace_id = select workspace_id from workmeetings where workmeeting_id = $workmeeting_id;


SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/c_workspaces/workspace_hub_display_4.sql?workspace_id='||$workspace_id
ELSE '/c_workspaces/workspace_hub_display_3.sql?workspace_id='||$workspace_id
END;

DELETE FROM workmeeting_participants
WHERE workmeeting_id=$workmeeting_id;

DELETE FROM workmeetings
WHERE workmeeting_id=$workmeeting_id


RETURNING 
    'redirect' AS component,
    $redirect_link AS link;


