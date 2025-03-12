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

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/c_workspaces/workmeeting_participants_display_4.sql?workmeeting_id='||$workmeeting_id
ELSE '/c_workspaces/workmeeting_participants_display_3.sql?workmeeting_id='||$workmeeting_id
END;

SET workspace_id=(SELECT workspace_id FROM workmeetings WHERE workmeeting_id=$workmeeting_id);

INSERT INTO workmeeting_participants
(
user_id,
workmeeting_id,
workspace_id
)
VALUES
(
$user_id,
$workmeeting_id,
$workspace_id
);

UPDATE workmeetings
SET
workmeeting_participants_nb = workmeeting_participants_nb +1,
modified_at=CURRENT_TIMESTAMP
WHERE workmeeting_id = $workmeeting_id

RETURNING 
    'redirect' AS component,
    $redirect_link AS link;


