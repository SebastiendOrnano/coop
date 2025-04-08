
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


SET project_id=(SELECT project_id FROM project_meeting where project_meeting_id=$project_meeting_id);


SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/e_project_meeting/project_meeting_main_display_4.sql?project_id='||$project_id
ELSE '/e_project_meeting/project_meeting_main_display_3.sql?project_id='||$project_id
END;

DELETE FROM project_meeting_participants
WHERE project_meeting_id = $project_meeting_id

DELETE FROM project_meeting
WHERE project_meeting_id = $project_meeting_id

RETURNING 'redirect' AS component,
 $redirect_link AS link;


