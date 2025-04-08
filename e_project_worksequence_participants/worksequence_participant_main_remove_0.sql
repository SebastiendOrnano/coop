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


DELETE FROM project_worksequence_participants  
WHERE worksequence_participant_id=$worksequence_participant_id;

UPDATE project_worksequence
SET 
worksequence_nb_participants= worksequence_nb_participants -1,
modified_at=CURRENT_TIMESTAMP
WHERE worksequence_id=$worksequence_id

select 
    'redirect' as component,
    $redirect_link  as link;