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
THEN '/e_project_meetings/project_meeting_participants_display_4.sql?project_meeting_id='||$project_meeting_id
ELSE '/e_project_meetings/project_meeting_participants_display_3.sql?project_meeting_id='||$project_meeting_id
END;

SET project_id=(SELECT project_id FROM project_meetings where project_meeting_id=$project_meeting_id);

INSERT INTO project_meeting_participants
(
user_id,
project_meeting_id,
project_meeting_participant_type,
project_meeting_participant_role
)
VALUES
(
$user_id,
$project_meeting_id,
'orga_member',
'participant'
);

UPDATE project_meetings
SET
project_meeting_participants_nb = project_meeting_participants_nb+1,
modified_at=CURRENT_TIMESTAMP
WHERE project_meeting_id = $project_meeting_id

RETURNING 
    'redirect' AS component,
    $redirect_link AS link;


