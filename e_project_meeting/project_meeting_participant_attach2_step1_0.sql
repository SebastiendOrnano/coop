SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
    CASE WHEN $user_role = 'supervisor' 
    THEN  '/e_project_meeting/project_meeting_participant_form2_step2_4.sql?project_meeting_id='||$project_meeting_id
    ELSE  '/e_project_meeting/project_meeting_participant_form2_step2_3.sql?project_meeting_id='||$project_meeting_id
END;

INSERT INTO project_meeting_participants
(
prm2_sub_id,
project_meeting_id
)

VALUES
(
:prm2_sub_id,
$project_meeting_id
)

UPDATE project_meeting
SET 
project_meeting_participants_nb = project_meeting_participants_nb +1,
modified_at=CURRENT_TIMESTAMP
WHERE project_meeting_id=$project_meeting_id

select 'redirect' as component,
$redirect_link as link;


