set workpackage_id = select workpackage_id from project_workpackage_waste where waste_id=$waste_id;

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN  '/e_project_workpackage_waste/waste_main_display_4.sql?workpackage_id='||$workpackage_id
ELSE  '/e_project_workpackage_waste/waste_main_display_3.sql?workpackage_id='||$workpackage_id
END;

DELETE FROM project_workpackage_waste WHERE waste_id  = $waste_id;

select 'redirect' as component,
$redirect_link as link;