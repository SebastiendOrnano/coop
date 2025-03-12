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
THEN  '/e_project_sprints/sprint_main_display_4.sql?project_id='||$project_id
ELSE  '/e_project_sprints/sprint_main_display_3.sql?project_id='||$project_id
END;

SET sprint_date_end_scheduled = DATE(:sprint_date_start_scheduled,'+'||:sprint_duration_scheduled||' days');

INSERT INTO project_sprints
(
	project_id,
	sprint_name,
	sprint_status,
	sprint_summary,
	sprint_todo,
	sprint_date_start_scheduled,
	sprint_date_end_scheduled,
    sprint_date_start_actual,
	sprint_date_end_actual,
    sprint_duration_scheduled,
    sprint_duration_actual,
    sprint_completion_percentage
	)
VALUES 
(
	$project_id,
	:sprint_name,
	'active',
	:sprint_summary,
	:sprint_todo,
	:sprint_date_start_scheduled,
	$sprint_date_end_scheduled,
    '',
    '',
	:sprint_duration_scheduled,
    '',
    ''
)

RETURNING 'redirect' AS component,
$redirect_link  AS link;


