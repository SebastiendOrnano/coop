SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN  '/e_project/project_hub_display_4.sql?project_id='||$project_id
ELSE  '/e_project/project_hub_display_3.sql?project_id='||$project_id
END;

INSERT INTO project_workpackage
(
	project_id,
	workpackage_name,
	workpackage_status,
	workpackage_type,
	workpackage_mode,
	workpackage_summary,
	workpackage_todo,
	workpackage_cost_estimated
	)
VALUES 
(
	$project_id,
	:workpackage_name,
	'active',
	:workpackage_type,
	:workpackage_mode,
	:workpackage_summary,
	:workpackage_todo,
	:workpackage_cost_estimated
)

RETURNING 'redirect' AS component,
$redirect_link  AS link;


