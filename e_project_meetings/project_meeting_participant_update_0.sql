
SET project_meeting_id= select project_meeting_id from project_meeting_participants where project_meeting_participant_id=$project_meeting_participant_id;

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
    CASE WHEN $user_role = 'supervisor' 
    THEN  '/e_project_meetings/project_meeting_participants_display_4.sql?project_meeting_id='||$project_meeting_id
    ELSE  '/e_project_meetings/project_meeting_participants_display_3.sql?project_meeting_id='||$project_meeting_id
END;



UPDATE project_meeting_participants
SET 
project_meeting_participant_role = :project_meeting_participant_role,
modified_at=CURRENT_TIMESTAMP
WHERE project_meeting_participant_id=$project_meeting_participant_id

select 'redirect' as component,
$redirect_link as link;


