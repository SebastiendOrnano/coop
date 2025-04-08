SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN     '/e_project_worksequence_participants/worksequence_participant_main_display_4.sql?worksequence_id='||$worksequence_id
ELSE     '/e_project_worksequence_participants/worksequence_participant_main_display_3.sql?worksequence_id='||$worksequence_id
END;


UPDATE project_worksequence_participants 
SET
worksequence_participant_status='archived',
modified_at=CURRENT_TIMESTAMP
WHERE worksequence_participant_id=$worksequence_participant_id;

select 
    'redirect'      as component,
    $redirect_link  as link;