SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/e_project_participants/project_participant_main_display_4.sql?project_id='||$project_id
ELSE '/e_project_participants/project_participant_main_display_3.sql?project_id='||$project_id
END;


UPDATE project_participants
SET
    project_participant_status = 
    CASE 
    WHEN :project_participant_status IS NULL OR :project_participant_status = '' THEN project_participant_status
    ELSE :project_participant_status END,

    project_participant_role = 
    CASE 
    WHEN project_participant_role IS NULL OR :project_participant_role = ''  THEN project_participant_role
    ELSE :project_participant_role END,

    modified_at = CURRENT_TIMESTAMP
WHERE project_participant_id=$project_participant_id
 
RETURNING  'redirect' AS component,
$redirect_link AS link;


