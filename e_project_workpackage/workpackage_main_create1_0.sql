SELECT 
	'redirect' AS component, 
	$redirect_link1 AS link
	WHERE $redirect_link1 != '' OR $redirect1 IS NOT NULL;

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

SET workpackage_date_end_scheduled = DATE(:workpackage_date_start_scheduled,'+'||:workpackage_duration_scheduled||' days');

INSERT INTO project_workpackage
(
	project_id,
	workpackage_name,
	workpackage_status,
	workpackage_summary,
	workpackage_todo,
	workpackage_date_start_scheduled,
	workpackage_date_end_scheduled,
    workpackage_date_start_actual,
	workpackage_date_end_actual,
    workpackage_duration_scheduled,
    workpackage_duration_actual,
    workpackage_completion_percentage
	)
VALUES 
(
	$project_id,
	:workpackage_name,
	'active',
	:workpackage_summary,
	:workpackage_todo,
	:workpackage_date_start_scheduled,
	$workpackage_date_end_scheduled,
    '',
    '',
	:workpackage_duration_scheduled,
    '',
    ''
)

RETURNING 'redirect' AS component,
$redirect_link  AS link;


