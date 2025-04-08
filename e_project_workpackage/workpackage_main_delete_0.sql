SET project_id= SELECT project_id from project_workpackage where workpackage_id=$workpackage_id;

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

DELETE FROM project_workpackage WHERE workpackage_id  = $workpackage_id;

select 'redirect' as component,
$redirect_link as link;