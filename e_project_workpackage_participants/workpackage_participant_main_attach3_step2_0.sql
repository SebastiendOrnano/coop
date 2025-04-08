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

SET prm1_id = SELECT prm1_id FROM prm2_sub_employees WHERE employee_id = :employee_id;



UPDATE project_workpackage_participants
SET
prm1_id=$prm1_id,
employee_id=:employee_id,
workpackage_participant_status='active',
workpackage_participant_type='employee',
workpackage_participant_role = :workpackage_participant_role
WHERE workpackage_participant_id = $workpackage_participant_id

UPDATE project_workpackage
SET 
workpackage_nb_participants = workpackage_nb_participants +1,
modified_at=CURRENT_TIMESTAMP
WHERE workpackage_id=$workpackage_id

select 'redirect' as component,
$redirect_link as link;



