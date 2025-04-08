
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

UPDATE project_meeting
SET
	project_meeting_title = :project_meeting_title,
	project_meeting_type =  :project_meeting_type,
	project_meeting_status = :project_meeting_status,
	project_meeting_visio = :project_meeting_visio,
	project_meeting_visio_url = :project_meeting_visio_url,
	project_meeting_visio_code = :project_meeting_visio_code,
	project_meeting_place_id = $project_meeting_place_id,
	project_meeting_agenda = :project_meeting_agenda,
	project_meeting_date = :project_meeting_date,
	project_meeting_hour_start = :project_meeting_hour_start,
	project_meeting_hour_end = :project_meeting_hour_end,
	project_meeting_duration =:project_meeting_duration,
    project_meeting_alert = :project_meeting_alert,
    modified_at=CURRENT_TIMESTAMP
WHERE project_meeting_id = $project_meeting_id

RETURNING 'redirect' AS component,
 $redirect_link AS link;


