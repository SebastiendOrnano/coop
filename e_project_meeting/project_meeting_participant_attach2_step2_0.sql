SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
    CASE WHEN $user_role = 'supervisor' 
    THEN  '/e_project_meeting/project_meeting_participants_display_4.sql?project_meeting_id='||$project_meeting_id
    ELSE  '/e_project_meeting/project_meeting_participants_display_3.sql?project_meeting_id='||$project_meeting_id
END;

SET prm1_id = SELECT prm1_id FROM prm2_sub_employees WHERE employee_id = :employee_id;

SET project_meeting_participant_id = select MAX(project_meeting_participant_id) from project_meeting_participants where  project_meeting_id = $project_meeting_id;


UPDATE project_meeting_participants
SET
prm1_id=$prm1_id,
employee_id=:employee_id,
project_meeting_participant_status='active',
project_meeting_participant_type='employee',
project_meeting_participant_role = :project_meeting_participant_role
WHERE project_meeting_participant_id = $project_meeting_participant_id

UPDATE project_meeting
SET 
project_meeting_participants_nb = project_meeting_participants_nb +1,
modified_at=CURRENT_TIMESTAMP
WHERE project_meeting_id=$project_meeting_id

select 'redirect' as component,
$redirect_link as link;


