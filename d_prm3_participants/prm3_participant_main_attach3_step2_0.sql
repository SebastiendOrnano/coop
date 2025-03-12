SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
    CASE WHEN $user_role = 'supervisor' 
    THEN '/d_prm3_participants/prm3_participant_main_display_4.sql?prm3_id='||$prm3_id
    ELSE '/d_prm3_participants/prm3_participant_main_display_3.sql?prm3_id='||$prm3_id
END;

SET prm1_id = SELECT prm1_id FROM prm2_sub_employees WHERE employee_id = :employee_id;



UPDATE prm3_participants
SET
prm1_id=$prm1_id,
employee_id=:employee_id,
prm3_participant_status='active',
prm3_participant_type='employee',
prm3_participant_role = :prm3_participant_role
WHERE prm3_participant_id = $prm3_participant_id

select 'redirect' as component,
$redirect_link as link;



