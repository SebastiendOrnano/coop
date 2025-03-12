SET workpackage_id= SELECT workpackage_id from project_worksequences where worksequence_id=$worksequence_id;

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN  '/e_project_worksequences/worksequence_main_display_4.sql?workpackage_id='||$workpackage_id
ELSE  '/e_project_worksequences/worksequence_main_display_3.sql?workpackage_id='||$workpackage_id
END;

DELETE FROM project_worksequences WHERE worksequence_id  = $worksequence_id;

select 
'redirect' as component,
$redirect_link as link;