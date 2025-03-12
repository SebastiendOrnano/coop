SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN  '/e_projects/project_main_display_4.sql'
ELSE  '/e_projects/project_main_display_4.sql'
END;

UPDATE projects
SET
project_status = :project_status,
project_name=:project_name,
project_summary=:project_summary,
project_date_creation=:project_date_creation,
project_category=:project_category,
modified_at = CURRENT_TIMESTAMP
WHERE project_id=$project_id

RETURNING 'redirect' AS component,
$redirect_link AS link;