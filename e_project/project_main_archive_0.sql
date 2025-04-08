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

UPDATE project
SET
project_status = 'archived',
modified_at = CURRENT_TIMESTAMP
WHERE project_id=$project_id

RETURNING 'redirect' AS component,
$redirect_link AS link;