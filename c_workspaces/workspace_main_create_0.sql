SET user_id = (
    SELECT users.user_id AS userID FROM users
    INNER JOIN sessions ON userID = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/c_workspaces/workspace_main_display_4.sql'
ELSE '/c_workspaces/workspace_main_display_3.sql'
END;

INSERT INTO workspaces 
(   
	workspace_title,
	workspace_coordinator_id,
	workspace_summary,
	workspace_category,
	workspace_status
)
VALUES 
(   :workspace_title,
	$user_id,
	:workspace_summary,
	:workspace_category,
	:workspace_status
	);

SET workspace_id = (SELECT MAX(workspace_id) FROM workspaces);

INSERT INTO workspace_participants
(
workspace_id,
user_id,
workspace_participant_id,
workspace_participant_role
)
VALUES
(
$workspace_id,
$user_id,
$user_id,
'coordinator'
)

RETURNING 'redirect' AS component,
 $redirect_link AS link;


