SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/e_project_worksequence_participants/worksequence_participant_main_display_4.sql?worksequence_id='||$worksequence_id
ELSE '/e_project_worksequence_participants/worksequence_participant_main_display_3.sql?worksequence_id='||$worksequence_id
END;


UPDATE project_worksequence_participants
SET
    worksequence_participant_status = 
    CASE 
    WHEN :worksequence_participant_status IS NULL OR :worksequence_participant_status = '' THEN worksequence_participant_status
    ELSE :worksequence_participant_status END,

    worksequence_participant_role = 
    CASE 
    WHEN worksequence_participant_role IS NULL OR :worksequence_participant_role = ''  THEN worksequence_participant_role
    ELSE :worksequence_participant_role END,

    modified_at = CURRENT_TIMESTAMP
WHERE worksequence_participant_id=$worksequence_participant_id
 
RETURNING  'redirect' AS component,
$redirect_link AS link;


