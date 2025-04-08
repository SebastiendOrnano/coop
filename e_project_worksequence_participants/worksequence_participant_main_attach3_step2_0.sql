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

SET prm1_id = SELECT prm1_id FROM prm2_sub_employees WHERE employee_id = :employee_id;



UPDATE project_worksequence_participants
SET
prm1_id=$prm1_id,
employee_id=:employee_id,
worksequence_participant_status='active',
worksequence_participant_type='employee',
worksequence_participant_role = :worksequence_participant_role
WHERE worksequence_participant_id = $worksequence_participant_id

UPDATE project_worksequence
SET 
worksequence_nb_participants = worksequence_nb_participants +1,
modified_at=CURRENT_TIMESTAMP
WHERE worksequence_id=$worksequence_id

select 'redirect' as component,
$redirect_link as link;



