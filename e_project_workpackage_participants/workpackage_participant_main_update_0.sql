SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/e_project_workpackage_participants/workpackage_participant_main_display_4.sql?workpackage_id='||$workpackage_id
ELSE '/e_project_workpackage_participants/workpackage_participant_main_display_3.sql?workpackage_id='||$workpackage_id
END;


UPDATE project_participants_workpackage
SET
    workpackage_participant_status = 
    CASE 
    WHEN :workpackage_participant_status IS NULL OR :workpackage_participant_status = '' THEN workpackage_participant_status
    ELSE :workpackage_participant_status END,

    workpackage_participant_role = 
    CASE 
    WHEN workpackage_participant_role IS NULL OR :workpackage_participant_role = ''  THEN workpackage_participant_role
    ELSE :workpackage_participant_role END,

    modified_at = CURRENT_TIMESTAMP
WHERE workpackage_participant_id=$workpackage_participant_id
 
RETURNING  'redirect' AS component,
$redirect_link AS link;


