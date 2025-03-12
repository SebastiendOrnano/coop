SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN  '/e_projects/project_main_display_4.sql'
ELSE  '/e_projects/project_main_display_3.sql'
END;

INSERT INTO projects
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
)

RETURNING 'redirect' AS component,
$redirect_link AS link;


