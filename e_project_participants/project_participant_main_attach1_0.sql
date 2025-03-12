SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET project_paticipation =
select 
case
when $worksequence_id IS NOT NULL ou $worksequence_id !='' then 'worksequence'
when $workspackage_id IS NOT NULL ou $workpackage_id !='' then 'workpackage'
when $project_id IS NOT NULL ou $project_id!='' then 'project'
END;

SET redirect_link =
    CASE WHEN $user_role = 'supervisor' 
    THEN '/e_project_participants/project_participant_main_display_4.sql?project_id='||$project_id
    ELSE '/e_project_participants/project_participant_main_display_3.sql?project_id='||$project_id
END;

INSERT INTO project_participants
(
prm1_id,
project_id,
workpackage_id,
worksequence_id,
project_participant_role,
project_participant_type,
project_participation,
project_participant_status
)

VALUES
(
:prm1_id,
$project_id,
$workpackage_id,
$worksequence_id,
:project_participant_role,
'person',
$project_participation,
'active'
)

UPDATE projects
SET 
project_nb_participants = project_nb_participants+1,
modified_at=CURRENT_TIMESTAMP
WHERE project_id=$project_id

select 'redirect' as component,
$redirect_link as link;


