SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN  '/e_project/project_main_display_4.sql'
ELSE  '/e_project/project_main_display_3.sql'
END;

SET redirect_link1 = (
    SELECT
        CASE
            WHEN EXISTS (
                SELECT 1 
                FROM project
                WHERE project_name = :project_name
            ) 
            THEN '/e_project/project_main_create_alert1_4.sql'
            ELSE ''
        END
);

SELECT 'redirect' AS component, $redirect_link1 AS link
WHERE $redirect_link1 != '' OR $redirect1 IS NOT NULL;

INSERT INTO project
(
	project_name,
	project_summary,
	project_category,
	project_status
)
VALUES 
(
	:project_name,
	:project_summary,
	:project_category,
	'active'
);

SET project_id = select MAX(project_id) from project where project_name = :project_name


INSERT INTO project_workpackage
(
	project_id,
	workpackage_rank,
	workpackage_mode,
	workpackage_name,
	workpackage_status,
	workpackage_date_start_scheduled,
	workpackage_duration_scheduled,
    workpackage_completion_percentage
)
VALUES 
(
	$project_id,
	'main',
	'mix',
	:project_name,
	'active',
	:project_date_start_scheduled,
	:project_duration_scheduled,
    '0'
)


RETURNING 'redirect' AS component,
$redirect_link AS link;


