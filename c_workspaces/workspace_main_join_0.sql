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
THEN '/c_workspaces/workspace_hub_display_4.sql?workspace_id='
ELSE '/c_workspaces/workspace_hub_display_3.sql?workspace_id='
END;


INSERT INTO workspace_participants
(
workspace_id,
workspace_participant_id,
workspace_participant_role
)
VALUES
(
$workspace_id,
$user_id,
'participant'
);

UPDATE workspaces
SET
workspace_participants_nb = workspace_participants_nb +1,
modified_at=CURRENT_TIMESTAMP
WHERE workspace_id = $workspace_id

RETURNING 
    'redirect' AS component,
    $redirect_link||$workspace_id AS link;


