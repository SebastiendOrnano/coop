SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
    CASE WHEN $user_role = 'supervisor' 
    THEN '/e_project_participants/project_participant_main_form3_step2_4.sql?project_id='||$project_id
    ELSE '/e_project_participants/project_participant_main_form3_step2_3.sql?project_id='||$project_id
END;

INSERT INTO project_participants
(
prm2_sub_id,
project_id
)

VALUES
(
:prm2_sub_id,
$project_id
)

select 'redirect' as component,
$redirect_link as link;


