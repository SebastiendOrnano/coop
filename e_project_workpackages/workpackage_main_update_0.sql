SET project_id = (select project_id from project_workpackages where workpackage_id=$workpackage_id);

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN  '/e_project_workpackages/workpackage_main_display_4.sql?project_id='||$project_id
ELSE  '/e_project_workpackages/workpackage_main_display_3.sql?project_id='||$project_id
END;


UPDATE project_workpackages 
SET 
workpackage_name=:workpackage_name,
workpackage_status=:workpackage_status,
workpackage_summary=:workpackage_summary,
workpackage_todo=:workpackage_todo,
workpackage_status=:workpackage_status,
workpackage_type=:workpackage_type,
workpackage_cost_estimated=:workpackage_cost_estimated,
workpackage_cost_actual=:workpackage_cost_actual,
modified_at = CURRENT_TIMESTAMP
WHERE workpackage_id = $workpackage_id

RETURNING 'redirect' AS component,
$redirect_link AS link;


