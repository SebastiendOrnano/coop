SET user_id = (
    SELECT users.user_id AS userID FROM users
    INNER JOIN sessions ON userID = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET user_role = (
    SELECT user_role FROM users
    INNER JOIN sessions ON users.user_id = sessions.user_id
    WHERE sessions.session_token = sqlpage.cookie('session_token')
); 

SET redirect_link =
CASE WHEN $user_role = 'supervisor' 
THEN '/c_workspaces/workspace_main_display_4.sql'
ELSE '/c_workspaces/workspace_main_display_3.sql'
END;

UPDATE workspaces 
SET
  	workspace_title = :workspace_title,
	workspace_summary = :workspace_summary,
	workspace_category = :workspace_category,
	workspace_status =  :workspace_status
where workspace_id=$workspace_id

RETURNING 'redirect' AS component,
 $redirect_link AS link;


